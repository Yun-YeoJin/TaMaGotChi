

import UIKit
import Toast


class SelectCollectionViewController: UICollectionViewController {
    
    var selectInfo = SelectInfo()
    
    var taMaGotChiDetail = TaMaGotChiInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //컬렉션뷰 위치 설정 및 3*N 설정
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
    // 셀의 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectInfo.TaMaGotChi.count
    }
    // 셀의 내용
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as! SelectCollectionViewCell
        
        let data = selectInfo.TaMaGotChi[indexPath.item]
        cell.CellDesign(data: data)
        cell.TaMaGotChiImageView.image = UIImage(named: data.image)
        
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        return cell
    }
    // 셀 선택시
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item > taMaGotChiDetail.taMaGotChiDetailArray.count { // 준비중인 셀 클릭 시
            self.view.makeToast("열심히 준비중이에요 >.<", duration: 2, position: .bottom, title: "개발하는 윤기사", completion: nil)
            
        } else { // 나머지 셀 클릭시
            
            let sb = UIStoryboard(name: "DetailPopUp", bundle: nil)
            
            let popupVC = sb.instantiateViewController(withIdentifier: "DetailPopUpViewController") as! DetailPopUpViewController
            
            popupVC.onTaMaGotChiData = taMaGotChiDetail.taMaGotChiDetailArray[indexPath.item] //데이터 넘김
            
            popupVC.modalPresentationStyle = .overCurrentContext
            present(popupVC, animated: true, completion: nil)
            
            
        }
        
    }
    
}
