import GoogleAPIClientForREST
import SwiftyJSON
import PromiseKit

class GoogleSheetsService {
    
    var service: GTLRSheetsService
    
    init(service: GTLRSheetsService) {
        self.service = service
    }
    
    func getSpreadsheet() -> Promise<JSON> {
        return Promise { resolve, reject in
            if let spreadSheetId = SaveManager.sharedInstance().get(key: String.spreadsheetId) {
                let query = GTLRSheetsQuery_SpreadsheetsGet
                    .query(withSpreadsheetId: spreadSheetId)
                query.fields = String.spreadsheetId

                service.executeQuery(query, completionHandler: { (_, result, error) in
                    if let error = error {
                        reject(error)
                    } else {
                        let result = JSON(result as Any)
                        resolve(result)
                    }
                })
            }
        }
    }
    
    func createSheet() {
//        SaveManager.sharedInstance().save(object: spreadSheetId as AnyObject, key: String.spreadsheetId)
//        let spreadSheetId = result[String.spreadsheetId].string
    }
}
