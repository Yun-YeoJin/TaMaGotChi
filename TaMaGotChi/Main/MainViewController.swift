
import UIKit

class MainViewController: UIViewController {
    
    var type = 0
        
    var BackGroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    var tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
    @IBOutlet weak var bubbleLabel: UILabel! //배열
    @IBOutlet weak var TaMaGotChiNameLabel: UILabel! //불러오기
    @IBOutlet weak var TaMaGotChiImageView: UIImageView!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var riceLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    
    @IBOutlet var underLine: [UIView]!
    
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var eatriceButton: UIButton!
    @IBOutlet weak var drinkwaterButton: UIButton!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        setTaMaGotChiImage(type: type, level: 6)
        setNavigationItem()
        TextfieldDesign()
        ButtonDesign()
        LabelDesign()
        view.backgroundColor = BackGroundColor
        
    }
    
    // UserDefaults를 이용한 네비게이션바 타이틀 설정
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        if UserDefaults.standard.string(forKey: "userName") == nil {
            navigationItem.title = "윤기사님의 다마고치"
        } else {
            navigationItem.title = "\(String(describing: UserDefaults.standard.string(forKey: "userName")!))님의 다마고치"
        }
        setBubbleLabel() //말풍선 대사 설정
    }
    
    @objc func personButtonClicked() {
        let sb = UIStoryboard(name: "Setting", bundle: nil)

        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController

        self.navigationController?.pushViewController(vc, animated: true)
    }
    // 텍스트 필드 디자인 설정
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
    // 버튼 디자인 설정
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
    // 네비게이션바 설정
    func setNavigationItem() {
        let personButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(personButtonClicked))
    
        navigationItem.rightBarButtonItem = personButton
        navigationItem.rightBarButtonItem?.tintColor = tintColor
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            backBarButtonItem.tintColor = tintColor
            self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    // 말풍선 대사 설정 (ViewWillAppear)
    func setBubbleLabel() {
        
        let name: String? = UserDefaults.standard.string(forKey: "userName")
        let bubbleLabelRandomText = ["오늘도 좋은 하루~~ 날씨가 엄청 좋아요!",
                                     "개발하는 윤기사 블로그에 많이 찾아가볼께요 ㅎㅎ",
                                     "이상한 변호사 우영우가 엄청 유행이라던데~~",
                                     "\(String(describing: name!))님 좋은 아침이에용!!!",
                                     "\(String(describing: name!))님 오늘도 빡코딩하고 계신가용??",
                                     "\(String(describing: name!))님 식사는 드시면서 하시나용!?",
                                     "\(String(describing: name!))님 배가 터져버릴 것 가타요...ㅠ.ㅠ",
                                     "\(String(describing: name!))님 깃허브에 푸쉬 안하셨죠? 얼른 하셔야죠!!",
                                     "\(String(describing: name!))님 역시 코딩은 밤에 해야죠?"
        ]
        bubbleLabel.text = bubbleLabelRandomText.randomElement()
        bubbleLabel.textColor = tintColor
        bubbleLabel.font = .boldSystemFont(ofSize: 15)
        bubbleLabel.textAlignment = .center
        bubbleLabel.numberOfLines = 0
    }
    // 다마고치 ImageView 설정
    func setTaMaGotChiImage(type: Int, level: Int) {
        TaMaGotChiImageView.image = UIImage(named: "\(type + 1)-\(level)")
    }
    
    // Label 디자인
    func LabelDesign() {
        
        TaMaGotChiNameLabel.textAlignment = .center
        TaMaGotChiNameLabel.textColor = tintColor
        TaMaGotChiNameLabel.layer.cornerRadius = 10
        TaMaGotChiNameLabel.layer.borderWidth = 1
        TaMaGotChiNameLabel.layer.borderColor = tintColor.cgColor
        TaMaGotChiNameLabel.backgroundColor = BackGroundColor
        TaMaGotChiNameLabel.font = .boldSystemFont(ofSize: 15)
        riceLabel.text = "밥알:"
        riceLabel.textAlignment = .center
        riceLabel.font = .systemFont(ofSize: 13)
        riceLabel.textColor = tintColor
        waterLabel.text = "물방울:"
        waterLabel.textAlignment = .center
        waterLabel.font = .systemFont(ofSize: 13)
        waterLabel.textColor = tintColor
        levelLabel.text = "LV:"
        levelLabel.textAlignment = .center
        levelLabel.font = .systemFont(ofSize: 13)
        levelLabel.textColor = tintColor

    }
    
    // 레벨업 관련 함수 선언
    func setLevel() {
        
        let currentValue = UserDefaults.standard.integer(forKey: "levelcount")
        
        let updateValue = currentValue + 1
        
        UserDefaults.standard.set(updateValue, forKey: "levelcount")
        
        levelLabel.text = "LV: \(UserDefaults.standard.integer(forKey: "levelcount"))"
        
    }
    
    // 밥먹기 버튼 클릭 시
    @IBAction func eatriceButtonClicked(_ sender: UIButton) {
        
            let currentValue = UserDefaults.standard.integer(forKey: "ricecount")
            let updateValue = currentValue + 1
            
            UserDefaults.standard.set(updateValue, forKey: "ricecount")
            
            riceLabel.text = "밥알: \(UserDefaults.standard.integer(forKey: "ricecount"))"

    }
    
    // 물먹기 버튼 클릭 시
    @IBAction func drinkwaterButtonClicked(_ sender: UIButton) {
        let currentValue = UserDefaults.standard.integer(forKey: "watercount")
        let updateValue = currentValue + 1
        
        UserDefaults.standard.set(updateValue, forKey: "watercount")
        
        waterLabel.text = "물방울: \(UserDefaults.standard.integer(forKey: "watercount"))"
    }
    
}




