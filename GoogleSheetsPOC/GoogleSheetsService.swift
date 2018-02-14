import GoogleAPIClientForREST
import SwiftyJSON
import PromiseKit

class GoogleSheetsService {
    
    var service: GTLRSheetsService
    
    init(service: GTLRSheetsService) {
        self.service = service
    }
    
    func checkSpreadsheet() -> Promise<Void> {
        return Promise { resolve, reject in
            if let spreadSheetId = SaveManager.sharedInstance().get(key: String.spreadsheetId) {
                let query = GTLRSheetsQuery_SpreadsheetsGet
                    .query(withSpreadsheetId: spreadSheetId)
                query.fields = String.spreadsheetId

                service.executeQuery(query, completionHandler: { (ticket, result, error) in
                    if let error = error {
                        reject(error)
                    } else {
                        let result = JSON(result.json)
                        let spreadSheetId = result[String.spreadsheetId].string
//                        SaveManager.sharedInstance().save(object: spreadSheetId as AnyObject, key: String.spreadsheetId)
                        resolve(spreadSheetId)
                    }
                })
            }
        }
    }
}
