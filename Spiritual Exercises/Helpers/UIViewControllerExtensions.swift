import UIKit

extension UIViewController{
    func performHorizontalAnimation(targetView: UIViewController) {
        let firstClassView = self.view
        let secondClassView = targetView.view
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        secondClassView?.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        if let window = UIApplication.shared.keyWindow {
            
            window.insertSubview(secondClassView!, aboveSubview: firstClassView!)
            
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                
                firstClassView?.frame = (firstClassView?.frame.offsetBy(dx: -screenWidth, dy: 0))!
                secondClassView?.frame = (secondClassView?.frame.offsetBy(dx: -screenWidth, dy: 0))!
                
            }, completion: {(Finished) -> Void in
                self.present(targetView, animated: false)
            })
        }
    }
}
