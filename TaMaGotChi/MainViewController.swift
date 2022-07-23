
import UIKit

class MainViewController: UIViewController {

    var BackGroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    var tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
    @IBOutlet weak var bubbleLabel: UILabel! //배열
    
    @IBOutlet weak var TaMaGotChiNameLavel: UILabel! //불러오기
    
    @IBOutlet weak var levelLabel: UILabel! // "LV \(1~10)"
    @IBOutlet weak var riceLabel: UILabel! // "밥알 \(count)개"
    @IBOutlet weak var waterLabel: UILabel! // "물방울 \(count)개"
    
    @IBOutlet var underLine: [UIView]!
    
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var eatriceButton: UIButton!
    @IBOutlet weak var drinkwaterButton: UIButton!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextfieldDesign()
        ButtonDesign()
        view.backgroundColor = BackGroundColor
    }
    
    func TextfieldDesign() {
        riceTextField.placeholder = "밥주세용"
        riceTextField.borderStyle = .none
        waterTextField.placeholder = "물주세용"
        waterTextField.borderStyle = .none
        riceTextField.textAlignment = .center
        waterTextField.textAlignment = .center
        
        for Line in underLine {
            Line.backgroundColor = tintColor
        }
    }
    
    func ButtonDesign() {
        eatriceButton.tintColor = tintColor
        eatriceButton.setTitle(" 밥먹기", for: .normal)
        drinkwaterButton.tintColor = tintColor
        drinkwaterButton.setTitle(" 물먹기", for: .normal)
        
        for Button in buttonCollection {
            Button.layer.cornerRadius = 10
            Button.layer.borderWidth = 1
            Button.layer.borderColor = tintColor.cgColor
        }
    }

}
