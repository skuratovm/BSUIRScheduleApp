//
//  UIButton extension.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 23.12.21.
//
import  UIKit
extension UIButton {
    func rotate(){
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
           rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi*20
        rotationAnimation.duration = 10
        rotationAnimation.isCumulative = true
        layer.add(rotationAnimation, forKey: nil)
    }
    func endRotate(){
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
           rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = 0
        rotationAnimation.duration = 0
        rotationAnimation.isCumulative = true
        layer.add(rotationAnimation, forKey: nil)
    }
}
