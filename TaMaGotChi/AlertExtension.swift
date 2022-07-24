

import UIKit
import Foundation

extension UIViewController {
    
    // 배경 색상 설정
    func setBackGround() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    // Alert 설정
    func showAlert(alertTitle: String, alertMessage: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
                let okButton = UIAlertAction(title: "맞쥐", style: .destructive) { (_) in
                    
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate

            let sb = UIStoryboard(name: "Select", bundle: nil)

            let vc = sb.instantiateViewController(withIdentifier: "SelectCollectionViewController") as! SelectCollectionViewController

            sceneDelegate?.window?.rootViewController = vc
            sceneDelegate?.window?.makeKeyAndVisible()
        
             
        }
        let cancel = UIAlertAction(title: "아니쥐", style: .default)

        alert.addAction(okButton)
        alert.addAction(cancel)
        
     present(alert, animated: true, completion: nil)
        
   
      
      }
    

 
    }
