import UIKit

class MainViewController: UIViewController {
    
    @IBAction func createAccountButton(_ sender: Any) {
        let viewController = SignInViewController(nibName: "SignInViewController", bundle: nil)
        //TODO: Add transition effect https://stackoverflow.com/questions/41440934/swift-unable-to-present-view-controller-from-top-to-bottom
        self.present(viewController, animated: true) {() -> Void in }
    }
    
    override func viewDidLoad() {
    }
    
}
