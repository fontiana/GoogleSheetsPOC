import GoogleAPIClientForREST
import UIKit

class SetSheetViewController: UIViewController {

    var service = GTLRSheetsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicatoryIn(uiView: self.view)
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
    
    @objc func displayResultWithTicket(ticket: GTLRServiceTicket,
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
    
    func showActivityIndicatoryIn(uiView: UIView) {
        let container: UIView = UIView()
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(hex: "ffffff")
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor(hex: "444444")
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2,
                                y: loadingView.frame.size.height / 2)
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        actInd.startAnimating()
    }
}
