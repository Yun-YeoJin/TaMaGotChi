

import UIKit

class DetailPopUpViewController: UIViewController {
    
    
    var onTaMaGotChiData: TaMaGotChiDetail? //다마고치 디테일 구조체 불러오기
    
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
        
        TaMaGotChiName.text = onTaMaGotChiData?.name
        TamaGotChiDesrciptionLabel.text = onTaMaGotChiData?.description
        TaMaGotChiImageView.image = UIImage(named: onTaMaGotChiData!.image)
        
        
        
    }
    //레이블 디자인
    func LabelDesign() {
        
        TaMaGotChiName.textColor = tintColor
        TaMaGotChiName.font = .boldSystemFont(ofSize: 14)
        TaMaGotChiName.textAlignment = .center
        TaMaGotChiName.layer.borderWidth = 1
        TaMaGotChiName.layer.borderColor = tintColor.cgColor
        TaMaGotChiName.layer.cornerRadius = 3
        
        
        TamaGotChiDesrciptionLabel.textColor = tintColor
        TamaGotChiDesrciptionLabel.textAlignment = .center
        
    }
    //버튼 디자인
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
    // 밑줄 디자인
    func underLineDesign() {
        underLineView.backgroundColor = tintColor
    }
    // 취소 버튼 클릭 시 팝업 창 내려가기
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // 시작 버튼 클릭 시
    @IBAction func StartButtonClicked(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        vc.type = onTaMaGotChiData?.type ?? 0
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: true, completion: nil)
        
        
        
    }
}



