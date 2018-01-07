import UIKit

// MARK: BasicLabel subclass

class BasicLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.textColor = UIColor.white
    }
    
    @IBInspectable var keyValue: String {
        get {
            return self.text!
        }
        set(value) {
            self.text = NSLocalizedString(value, comment: "")
        }
    }
}

// MARK: SubtitleLabel subclass

class SubtitleLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.textColor = UIColor.white
        self.font = UIFont.systemFont(ofSize: 22)
    }
    
    @IBInspectable var keyValue: String {
        get {
            return self.text!
        }
        set(value) {
            self.text = NSLocalizedString(value, comment: "")
        }
    }
}
