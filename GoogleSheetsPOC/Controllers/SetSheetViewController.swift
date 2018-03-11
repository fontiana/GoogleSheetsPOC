import GoogleAPIClientForREST
import SwiftyJSON
import UIKit

class SetSheetViewController: UIViewController {
    
    var service = GTLRSheetsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressView.shared.showProgressView(self.view)
        
        let googleSheetsService = GoogleSheetsService(service: service)
        
        googleSheetsService.getSpreadsheet()
            .then { sheet -> Void in
                print(sheet)
            }.catch { (error) in
                let alertController = UIAlertController(title: "Error",
                                                        message: error.localizedDescription,
                                                        preferredStyle: .alert)
                alertController.show()
        }
        
    }
}
