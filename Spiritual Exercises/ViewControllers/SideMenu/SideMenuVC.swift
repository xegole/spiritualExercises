import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class SideMenuVC: UIViewController {
    
    @IBOutlet var tblMenuOptions : UITableView!
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    var arrayMenuOptions = [Dictionary<String,String>]()
    var btnMenu : UIButton!
    
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()
        tblMenuOptions.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Home", "icon":"menuHome"])
        arrayMenuOptions.append(["title":"More Information", "icon":"menuHome"])
        arrayMenuOptions.append(["title":"Extra Material", "icon":"menuExtraMaterial"])
        arrayMenuOptions.append(["title":"Consultation", "icon":"menuHome"])
        arrayMenuOptions.append(["title":"Donate", "icon":"menuHome"])
        arrayMenuOptions.append(["title":"Profile", "icon":"menuHome"])
        arrayMenuOptions.append(["title":"Share", "icon":"menuHome"])
        
        tblMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
}

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sideMenuCell = UITableViewCell(style: .value1, reuseIdentifier: "SideMenuCell")
        sideMenuCell.textLabel?.text = arrayMenuOptions[indexPath.row]["title"]!
        sideMenuCell.imageView?.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        return sideMenuCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
}
