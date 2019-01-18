import UIKit

class MoreInformationVC: BaseVC {
    
    @IBOutlet weak var tblWelcome: UITableView!
    
    let arrayItems = WelcomeItem.getArrayMock()
    let tableCellId = "WelcomeItemCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "More Information"
        let cellNib = UINib(nibName: self.tableCellId, bundle: nil)
        self.tblWelcome.register(cellNib, forCellReuseIdentifier: self.tableCellId)
        self.tblWelcome.rowHeight = UITableView.automaticDimension
    }
}

extension MoreInformationVC: UITableViewDelegate, UITableViewDataSource{
    
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
