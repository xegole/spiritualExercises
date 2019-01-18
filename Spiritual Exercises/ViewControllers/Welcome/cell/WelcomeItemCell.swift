import UIKit

class WelcomeItemCell: UITableViewCell {

    @IBOutlet weak var labelTittle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var container: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.container.layer.borderWidth = 1.0
        self.container.layer.borderColor = UIColor.gray.cgColor
        self.container.layer.cornerRadius = 8
        self.container.layer.masksToBounds = true
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
