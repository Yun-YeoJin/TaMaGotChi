

import UIKit
import Toast


class SelectCollectionViewController: UICollectionViewController {
    
    var TaMaGotChiList = SelectInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = spacing
        
        navigationController?.navigationBar.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        collectionView.collectionViewLayout = layout
    
}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TaMaGotChiList.TaMaGotChi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as! SelectCollectionViewCell
        
        let data = TaMaGotChiList.TaMaGotChi[indexPath.item]
        cell.CellDesign(data: data)
        cell.TaMaGotChiImageView.image = UIImage(named: data.image)
        
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailPopUp", bundle: nil)
        
        let popupVC = sb.instantiateViewController(withIdentifier: "DetailPopUpViewController") as! DetailPopUpViewController
        
        popupVC.modalPresentationStyle = .overCurrentContext
        present(popupVC, animated: true, completion: nil)
        
        if indexPath.item > 2 {
            self.view.makeToast("열심히 준비중이에요 >.<", duration: 2, position: .bottom, title: "개발하는 윤기사", completion: nil)
        }
    
}
    
}
