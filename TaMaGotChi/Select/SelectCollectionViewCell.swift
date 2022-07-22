

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var TaMaGotChiImageView: UIImageView!
    
    @IBOutlet weak var TaMaGotChiNameLabel: UILabel!
    
  
    
    func CellDesign(data: TaMaGotChiName) {
        
        TaMaGotChiNameLabel.text = data.name
        TaMaGotChiNameLabel.textAlignment = .center
        TaMaGotChiNameLabel.layer.cornerRadius = 5
        TaMaGotChiNameLabel.layer.borderWidth = 1
        TaMaGotChiNameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        TaMaGotChiNameLabel.font = .systemFont(ofSize: 13)
        TaMaGotChiNameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        
        TaMaGotChiImageView.layer.cornerRadius = TaMaGotChiImageView.frame.height / 2
        TaMaGotChiImageView.layer.borderWidth = 1
        TaMaGotChiImageView.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        TaMaGotChiImageView.clipsToBounds = true
    }
    
}
