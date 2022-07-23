

import UIKit

class DetailPopUpViewController: UIViewController {

    var TaMaGotChiNameArray = ["따끔따끔 다마고치": "헤헷 쪼아용", "방실방실 다마고치": "더더 쪼아용", "반짝반짝 다마고치": "무자하게 쪼아용"]
  
    
    
    var BackGroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    var tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
    @IBOutlet weak var popupBackGroundView: UIView!
    @IBOutlet weak var TaMaGotChiImageView: UIImageView!
    
    @IBOutlet weak var TaMaGotChiName: UILabel!
    @IBOutlet weak var TamaGotChiDesrciptionLabel: UILabel!
    @IBOutlet weak var underLineView: UIView!
    
  
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelDesign()
        ButtonDesign()
        underLineDesign()
        
        popupBackGroundView.backgroundColor = BackGroundColor
        popupBackGroundView.layer.cornerRadius = 10
     
    }

    func LabelDesign() {

        TaMaGotChiName.textColor = tintColor
        TaMaGotChiName.font = .boldSystemFont(ofSize: 14)
        TaMaGotChiName.textAlignment = .center
        TaMaGotChiName.layer.borderWidth = 1
        TaMaGotChiName.layer.borderColor = tintColor.cgColor
        TaMaGotChiName.layer.cornerRadius = 3
    
        
        TamaGotChiDesrciptionLabel.textColor = tintColor
        TamaGotChiDesrciptionLabel.text = "다마고치에용"
        TamaGotChiDesrciptionLabel.textAlignment = .center
        
    }
    
    func ButtonDesign() {
        changeButton.tintColor = tintColor
        changeButton.backgroundColor = BackGroundColor
        changeButton.clipsToBounds = true
        changeButton.setTitle("시작하기", for: .normal)
        changeButton.layer.borderWidth = 0.5
        changeButton.layer.borderColor = tintColor.cgColor
        cancelButton.tintColor = tintColor
        cancelButton.backgroundColor = BackGroundColor
        cancelButton.clipsToBounds = true
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.layer.borderWidth = 0.5
        cancelButton.layer.borderColor = tintColor.cgColor
        

        }
    
    func underLineDesign() {
        underLineView.backgroundColor = tintColor
    }
        
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}



//배경색상 : UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

//폰트, 테두리 색상 : UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
