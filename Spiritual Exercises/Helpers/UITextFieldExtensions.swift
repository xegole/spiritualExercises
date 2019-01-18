import UIKit

extension UITextField {
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        self.layer.borderColor = UIColor.red.cgColor
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
    
    func isValid(errorText: String) -> Bool{
        if let value = self.text, !value.isEmpty {
            return true;
        } else {
            self.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2, revert: true)
            self.attributedPlaceholder = NSAttributedString(string: errorText,attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return false;
        }
    }
}
