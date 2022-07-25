
import UIKit

class SettingTableViewController: UITableViewController {
    
    var Menu = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    var imageList = ["pencil", "moon.fill", "arrow.clockwise"]
    var nickname: String = "윤기사"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "설정"
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData() // 데이터 불러오기
        
    }
    // 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    // 셀 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.count
    }
    // 셀의 내용
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        cell.CellDesign()
        cell.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        cell.SettingMenu.text = Menu[indexPath.row]
        cell.FirstImageView.image = UIImage(systemName: imageList[indexPath.row])
        
        // 셀의 맨 위 0번 선택시
        if indexPath.row == 0 {
            cell.UserNickName.text = UserDefaults.standard.string(forKey: "userName")
        }
        else { // 1번, 2번 선택 시
            cell.UserNickName.text = ""
        }
        
        tableView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        return cell
        
    }
    
    // 셀 선택 시
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 { //이름 변경하기 클릭시
            let sb = UIStoryboard(name: "ChangeName", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "ChangeNameViewController") as! ChangeNameViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 1 { //다마고치 변경하기 클릭시
            
            SelectCollectionViewController.selectTitle = "변경"
            
            let sb = UIStoryboard(name: "Select", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
      
            
        } else if indexPath.row == 2 { //데이터 초기화 클릭시
            
            showAlert(alertTitle: "데이터 초기화", alertMessage:"정말 다시 처음부터 시작하실 건가요!?")
            
            SelectCollectionViewController.selectTitle = "시작"
            
            UserDefaults.standard.removeObject(forKey: "ricecount")
            UserDefaults.standard.removeObject(forKey: "watercount")
            UserDefaults.standard.removeObject(forKey: "levelcount")
            UserDefaults.standard.removeObject(forKey: "userName")
            
            
            
        }
    }
    
    
    
    
}



