import GoogleAPIClientForREST
import GoogleSignIn
import UIKit

class SignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    private let scopes = [kGTLRAuthScopeSheetsSpreadsheetsReadonly]
    
    private let service = GTLRSheetsService()
    let signInButton = GIDSignInButton()
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true) { }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = [
            "https://www.googleapis.com/auth/spreadsheets"
        ]
        
        GIDSignIn.sharedInstance().clientID = "832262025030-be31sijfsd1btmfh6f3hm0u0bd8u1nou.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        setView()
    }
    
    func setView() {
        signInButton.center = self.view.center
        signInButton.style = GIDSignInButtonStyle.standard
        view.addSubview(signInButton)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            let alertController = UIAlertController(title: "Authentication Error",
                                                    message: error.localizedDescription, preferredStyle: .alert)
            alertController.show()
            self.service.authorizer = nil
        } else {
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            navigate()
        }
    }
    
    func navigate() {
        let setSheetViewController = SetSheetViewController()
        setSheetViewController.service = service
        self.present(setSheetViewController, animated: true, completion: nil)
    }
}
