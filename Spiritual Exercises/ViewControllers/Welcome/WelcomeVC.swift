import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonLogin: UIButton!
    
    let arrayItems = WelcomeItem.getArrayMock()
    let tableCellId = "WelcomeItemCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        self.buttonLogin.layer.borderWidth = 0.1
        self.buttonLogin.layer.borderColor = UIColor.black.cgColor
        self.buttonLogin.layer.cornerRadius = 5
        self.buttonLogin.layer.masksToBounds = true
        
        let cellNib = UINib(nibName: self.tableCellId, bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: self.tableCellId)
        self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func onLoginAction(_ sender: Any) {
        UserDefaults.standard.setFirstTime(value: true)
        let loginVC:LoginVC = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
}

extension WelcomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: self.tableCellId) as! WelcomeItemCell
        let itemWelcome = arrayItems[indexPath.row]
        itemCell.labelTittle.text = itemWelcome.title
        itemCell.labelDescription.text = itemWelcome.description
        let image = UIImage(named: itemWelcome.pathImage)
        itemCell.imageItem.image = image?.squared
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let welcomeItem = arrayItems[indexPath.row]
        let detailInfomationVC = DetailInformationVC()
        detailInfomationVC.welcomeItem = welcomeItem
        self.navigationController?.pushViewController(detailInfomationVC, animated: true)
    }
}
