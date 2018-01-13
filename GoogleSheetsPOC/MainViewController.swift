import UIKit

class MainViewController: UIViewController {
    
    @IBAction func createAccountButton(_ sender: Any) {
        let viewController = SignInViewController(nibName: "SignInViewController", bundle: nil)
        present(viewController, animated: true) {() -> Void in }
    }
    
    override func viewDidLoad() {
    }
    
}
