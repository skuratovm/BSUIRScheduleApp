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

        }
        alertController.addAction(alertOk)
        alertController.addAction(alertRefresh)
        present(alertController,animated: true)
    }
}


