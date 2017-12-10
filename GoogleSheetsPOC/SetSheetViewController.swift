import GoogleAPIClientForREST
import UIKit

class SetSheetViewController: UIViewController {

    var service = GTLRSheetsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSheet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func displayResultWithTicket(ticket: GTLRServiceTicket,
                                 finishedWithObject result: GTLRSheets_ValueRange,
                                 error: NSError?) {
        
        if let error = error {
            let alertController = UIAlertController(title: "Error",
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.show()
            return
        }
    }
}
