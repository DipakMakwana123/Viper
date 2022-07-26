//
//  UIViewController+Extension.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 26/07/22.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String,msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                
            })
            alert.addAction(okAction)
            
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
