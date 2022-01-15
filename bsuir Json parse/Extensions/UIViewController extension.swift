//
//  UIViewController extension.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 15.01.22.
//

import UIKit
extension UIViewController{
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

