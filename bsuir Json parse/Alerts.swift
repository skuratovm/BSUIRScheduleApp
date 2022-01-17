//
//  Alerts.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 23.12.21.
//

import UIKit

extension ViewController {
    func errorArlert(title: String,message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let alertOk = UIAlertAction(title: "OK", style: .cancel) { (_) in
    
        }
        let alertRefresh = UIAlertAction(title: "Повторить", style: .default) { (_) in
            NotificationCenter.default.post(name: Notification.Name("ref"), object: nil)
        }
        alertController.addAction(alertOk)
        alertController.addAction(alertRefresh)
        present(alertController,animated: true)
    }
    
    func setUpGroupAlert(title: String,message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let alertCencel = UIAlertAction(title: "Отмена", style: .cancel) { (_) in
    
        }
        let alertDelete = UIAlertAction(title: "Удалить", style: .destructive) { (_) in
            NotificationCenter.default.post(name: Notification.Name("del"), object: nil)
        }
        alertController.addAction(alertCencel)
        alertController.addAction(alertDelete)
        present(alertController,animated: true)
    }
    
    
}


