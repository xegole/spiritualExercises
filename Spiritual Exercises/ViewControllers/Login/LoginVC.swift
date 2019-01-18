import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var containerLogin: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerLogin.layer.borderWidth = 1.0
        self.containerLogin.layer.borderColor = UIColor.gray.cgColor
        self.containerLogin.layer.cornerRadius = 8
        self.containerLogin.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func onRegister(_ sender: Any) {
        let registerVC = RegisterVC()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    @IBAction func onLogin(_ sender: Any) {
        UserDefaults.standard.setLoggedIn(value: true)
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}
