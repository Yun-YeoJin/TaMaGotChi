
import UIKit

class ChangeNameViewController: UIViewController {
    
    @IBOutlet weak var changeNameTextField: UITextField!
    
    @IBOutlet weak var textfieldUnderLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeNameTextFieldDesign()
        underLineDesign()
        
        let rightButtonToSave = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = rightButtonToSave
        
        navigationItemDesign()
        
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
    }
    // 저장하기
    @objc func saveButtonClicked() {
        UserDefaults.standard.set(changeNameTextField.text, forKey: "userName")
        self.view.makeToast("이름 변경 완료 >3<", duration: 1, position: .center, completion: nil)
    }
    // 텍스트 필드 디자인
    func changeNameTextFieldDesign() {
        changeNameTextField.placeholder = "변경하실 이름을 적어주세요."
        changeNameTextField.borderStyle = .none
        changeNameTextField.backgroundColor = .clear
    }
    // 밑줄 디자인
    func underLineDesign() {
        textfieldUnderLine.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    //네비게이션 아이템 디자인
    func navigationItemDesign() {
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        navigationItem.title = "대장님 이름 정하기"
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        navigationItem.titleView?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    
}
