//
//  Setting Functions.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 15.01.22.
//

import Foundation
import UIKit

class SetUpInticatorView {
    static let shared = SetUpInticatorView()
    
    private init() {}
    
    func configureIndicatorView(lessonType: String,indicatorView: UIView ){
        if lessonType == "ЛК"{
            indicatorView.backgroundColor = .systemGreen
        }
        if lessonType == "ПЗ"{
            indicatorView.backgroundColor = .systemYellow
        }
        if lessonType == "ЛР"{
            indicatorView.backgroundColor = .systemBlue
        }
    }
}
