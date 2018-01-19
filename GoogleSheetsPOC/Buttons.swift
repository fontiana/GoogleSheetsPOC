import UIKit

// MARK: SignInButton subclass

class SignInButton: UIButton {
    
    @IBInspectable var keyValue: String {
        get {
            return self.titleLabel!.text!
        }
        set(value) {
            self.setTitle(NSLocalizedString(value, comment: ""), for: .normal)
        }
    }
    
    // MARK: Overrides
    override public func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    // MARK: Private
    private func commonInit() {
        self.setTitleColor(UIColor.white, for: .normal)
        let googleLogo = UIImage(named: "google-logo.png")
        self.setImage(googleLogo?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        self.layer.borderWidth = 1 //TODO: Change to image so there will be fade-out animation
        self.layer.borderColor = UIColor.white.cgColor //TODO: Change to image so there will be fade-out animation
    }
}

// MARK: HiperlinkButton subclass

class HiperlinkButton: UIButton {
    
    @IBInspectable var keyValue: String {
        get {
            return self.titleLabel!.text!
        }
        set(value) {
            self.setTitle(NSLocalizedString(value, comment: ""), for: .normal)
        }
    }
    
    // MARK: Overrides
    override public func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    // MARK: Private
    private func commonInit() {
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
}
