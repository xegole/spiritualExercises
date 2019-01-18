import UIKit
import SVProgressHUD

class HomeVC: BaseVC {

    @IBOutlet weak var tblExercises: UITableView!
    
    let tableCellId = "ExcerciseItemCell"
    var groupExcercises: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Spiritual Excercises"
        
        let cellNib = UINib(nibName: self.tableCellId, bundle: nil)
        self.tblExercises.register(cellNib, forCellReuseIdentifier: self.tableCellId)
        self.tblExercises.rowHeight = UITableView.automaticDimension
        
        SVProgressHUD.show(withStatus: "loading exercises")
        APIClient.getExercises{ result in
            switch result {
            case .success(let exercises):
                self.groupExcercises = exercises.groups
                self.tblExercises.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            SVProgressHUD.dismiss()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: self.tableCellId) as! ExcerciseItemCell
        let group = groupExcercises[indexPath.row]
//        itemCell.labelTittle.text = exercise.title
//        itemCell.labelDescription.text = exercise.description
//        let image = UIImage(named: exercise.pathImage)
        //itemCell.imageItem.image = image?.squared
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupExcercises.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
//        let exercise = exercises[indexPath.row]
//        let detailInfomationVC = DetailInformationVC()
//        detailInfomationVC.welcomeItem = welcomeItem
//        self.navigationController?.pushViewController(detailInfomationVC, animated: true)
    }
}
