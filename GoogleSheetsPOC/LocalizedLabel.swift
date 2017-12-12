import UIKit

class LocalizedLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.textColor = UIColor.gray
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
