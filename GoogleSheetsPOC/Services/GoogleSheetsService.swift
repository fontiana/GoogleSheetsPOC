import GoogleAPIClientForREST
import SwiftyJSON
import PromiseKit

class GoogleSheetsService {
    
    var service: GTLRSheetsService
    
    init(service: GTLRSheetsService) {
        self.service = service
    }
    
    func start() -> Promise<JSON> {
        return Promise { resolve, reject in
            getSpreadsheet()
                .then { sheet -> Void in
                    if let sheet = sheet {
                        resolve(sheet)
                    } else {
                        
                    }
                }
                .catch { error in
                    
                    reject(error)
            }
        }
    }
    
    func getSpreadsheet() -> Promise<JSON?> {
        return Promise { resolve, reject in
            if let spreadSheetId = SaveManager.sharedInstance().get(key: SpreadsheetConst.spreadsheetId) {
                let query = GTLRSheetsQuery_SpreadsheetsGet
                    .query(withSpreadsheetId: spreadSheetId)
                query.fields = SpreadsheetConst.spreadsheetId
                
                service.executeQuery(query, completionHandler: { (_, result, error) in
                    if let error = error {
                        reject(error)
                    } else if let result = result {
                        let json = JSON(result)
                        resolve(json)
                    }
                })
            }
        }
    }
    
    func createSheet() -> Promise<JSON> {
        return Promise { resolve, reject in
            let newSheet = GTLRSheets_Spreadsheet.init()
            let properties = GTLRSheets_SpreadsheetProperties.init()
            
            properties.title = "Google Sheets POC"
            newSheet.properties = properties
            
            let query = GTLRSheetsQuery_SpreadsheetsCreate
                .query(withObject: newSheet)
            query.fields = SpreadsheetConst.spreadsheetId
            
            service.executeQuery(query, completionHandler: { (_, result, error) in
                ProgressView.shared.hideProgressView()
                if let error = error {
                    reject(error)
                } else if let result = result {
                    let json = JSON(result)
                    let spreadSheetId = json[SpreadsheetConst.spreadsheetId].string
                    SaveManager.sharedInstance().save(object: spreadSheetId as AnyObject,
                                                      key: SpreadsheetConst.spreadsheetId)
                    resolve(json)
                }
                reject(SpreadsheetServiceError.erroDesconhecido)
            })
        }
    }
    
}
