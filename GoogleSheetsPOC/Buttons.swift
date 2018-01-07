import UIKit

// MARK: CreateAccountButton subclass

class CreateAccountButton: UIButton {
    
    // MARK: Public interface
    /// Corner radius of the background rectangle
    public var roundRectCornerRadius: CGFloat = 2 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /// Color of the background rectangle
    public var roundRectColor: UIColor = UIColor(hex: "8AD1DD") {
        didSet {
            self.setNeedsLayout()
        }
    }
    
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
    private var roundRectLayer: CAShapeLayer?
    
    private func commonInit() {
        self.setTitleColor(UIColor.white, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        if let existingLayer = roundRectLayer {
            existingLayer.removeFromSuperlayer()
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: roundRectCornerRadius).cgPath
        shapeLayer.fillColor = roundRectColor.cgColor
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.roundRectLayer = shapeLayer
    }
}

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
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
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
