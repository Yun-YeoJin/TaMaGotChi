
import UIKit

class ChangeNameViewController: UIViewController {

    @IBOutlet weak var changeNameTextField: UITextField!
    
    @IBOutlet weak var textfieldUnderLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


       chanNameTextFieldDesign()
        underLineDesign()
        
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
    }

    func chanNameTextFieldDesign() {
        changeNameTextField.placeholder = "변경하실 이름을 적어주세요."
        changeNameTextField.borderStyle = .none
        changeNameTextField.backgroundColor = .clear
    }
    
    func underLineDesign() {
        textfieldUnderLine.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
 

}
