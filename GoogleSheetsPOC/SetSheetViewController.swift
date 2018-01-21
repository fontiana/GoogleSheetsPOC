import GoogleAPIClientForREST
import SwiftyJSON
import UIKit

class SetSheetViewController: UIViewController {

    var service = GTLRSheetsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressView.shared.showProgressView(self.view)
        createSheet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkSpreadsheet() {
        let query = GTLRSheetsQuery_SpreadsheetsGet
            .query(withSpreadsheetId: "")
        query.fields = "spreadsheetId"
        
        service.executeQuery(query,
                             delegate: self,
                             didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
    }
    
    func createSheet() {
        let newSheet = GTLRSheets_Spreadsheet.init()
        let properties = GTLRSheets_SpreadsheetProperties.init()
        
        properties.title = "Google Sheets POC"
        newSheet.properties = properties
        
        let query = GTLRSheetsQuery_SpreadsheetsCreate
            .query(withObject: newSheet)
        query.fields = "spreadsheetId"
        
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
        
        let result = JSON(result.json)
        let spreadSheetId = result["spreadsheetId"].string
    }
}
