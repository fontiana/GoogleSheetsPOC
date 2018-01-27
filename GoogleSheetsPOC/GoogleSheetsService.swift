import GoogleAPIClientForREST
import SwiftyJSON
import PromiseKit

class GoogleSheetsService {
    
    var service: GTLRSheetsService
    
    init(service: GTLRSheetsService) {
        self.service = service
    }
    
    func checkSpreadsheet() {
        if let spreadSheetId = SaveManager.sharedInstance().get(key: String.spreadsheetId) {
            let query = GTLRSheetsQuery_SpreadsheetsGet
                .query(withSpreadsheetId: spreadSheetId)
            query.fields = String.spreadsheetId
            
            service.executeQuery(query,
                                 delegate: self,
                                 didFinish: #selector(displayCheckesultWithTicket(ticket:finishedWithObject:error:)))
        }
    }
    
    @objc func displayCheckesultWithTicket(ticket: GTLRServiceTicket,
                                           finishedWithObject result: GTLRSheets_ValueRange,
                                           error: NSError?) {
        if let error = error {
            return
        } else if let json = result.json {
            let result = JSON(json)
            let spreadSheetId = result[String.spreadsheetId].string
            SaveManager.sharedInstance().save(object: spreadSheetId as AnyObject, key: String.spreadsheetId)
            return
        } else {
            return
        }
    }
}
