import GoogleAPIClientForREST
import SwiftyJSON
import UIKit

class SetSheetViewController: UIViewController {
    
    var service = GTLRSheetsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressView.shared.showProgressView(self.view)
        
        checkSpreadsheet()
        createSheet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } 
    
    func checkSpreadsheet() {
        if let spreadSheetId = SaveManager.sharedInstance().get(key: String.spreadsheetId) {
            let query = GTLRSheetsQuery_SpreadsheetsGet
                .query(withSpreadsheetId: spreadSheetId)
            query.fields = String.spreadsheetId
            
            service.executeQuery(query,
                                 delegate: self,
                                 didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
        }
    }
    
    func createSheet() {
        let newSheet = GTLRSheets_Spreadsheet.init()
        let properties = GTLRSheets_SpreadsheetProperties.init()
        
        properties.title = "Google Sheets POC"
        newSheet.properties = properties
        
        let query = GTLRSheetsQuery_SpreadsheetsCreate
            .query(withObject: newSheet)
        query.fields = String.spreadsheetId
        
        service.executeQuery(query,
                             delegate: self,
                             didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
    }
    
    @objc func displayResultWithTicket(ticket: GTLRServiceTicket,
                                       finishedWithObject result: GTLRSheets_ValueRange,
                                       error: NSError?) {
        ProgressView.shared.hideProgressView()
        if let error = error {
            let alertController = UIAlertController(title: "Error",
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.show()
            return
        }
        
        if let json = result.json {
            let result = JSON(json)
            let spreadSheetId = result["spreadsheetId"].string
            SaveManager.sharedInstance().save(object: spreadSheetId as AnyObject,
                                              key: String.spreadsheetId)
        }
    }
}
