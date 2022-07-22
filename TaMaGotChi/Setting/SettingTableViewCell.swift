

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var FirstImageView: UIImageView!
    
    @IBOutlet weak var SettingMenu: UILabel!
    
    @IBOutlet weak var UserNickName: UILabel!

    func CellDesign() {
    
        FirstImageView.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        SettingMenu.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        SettingMenu.font = .boldSystemFont(ofSize: 15)
        
        
}
}
