
import UIKit

class SettingTableViewController: UITableViewController {
        
    var Menu = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    var imageList = ["pencil", "moon.fill", "arrow.clockwise"]
    var nickname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
       
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        cell.CellDesign()
        cell.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    
        cell.SettingMenu.text = Menu[indexPath.row]
        cell.FirstImageView.image = UIImage(systemName: imageList[indexPath.row])
        cell.UserNickName.text = nickname
        
        tableView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        return cell
        
       
    }
    
    
    }

    
 
