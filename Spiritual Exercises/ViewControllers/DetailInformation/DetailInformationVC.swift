import UIKit
import SVProgressHUD

class DetailInformationVC: UIViewController {
    
    @IBOutlet weak var wvInformation: UIWebView!
    var welcomeItem : WelcomeItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.welcomeItem?.title
        self.initWebView()
        self.setUpNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func initWebView(){
        let pathHtml = welcomeItem?.pathImage
        if let path = Bundle.main.path(forResource: pathHtml, ofType: "html"){
            let url = URL(fileURLWithPath: path)
            let request = URLRequest(url: url)
            wvInformation.loadRequest(request)
            SVProgressHUD.show(withStatus: "loading")
        }
    }
    
    private func setUpNavBar(){
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension DetailInformationVC: UIWebViewDelegate{
    func webViewDidFinishLoad(_ webView : UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
}
