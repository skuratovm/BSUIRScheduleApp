//
//  InfoViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 26.11.21.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var lessonTypeLabel: UILabel!
    @IBOutlet weak var teacherImageView: UIImageView!{
        didSet{
            teacherImageView.layer.cornerRadius = teacherImageView.frame.height / 2
            teacherImageView.layer.borderWidth = 1
            teacherImageView.layer.borderColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
            teacherImageView.image = #imageLiteral(resourceName: "Teacher-PNG-Free-Image.png")
        }
    }
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var teacherDegree: UILabel!
    
    
    
    
    @IBOutlet weak var indicatorView: UIView!{
        didSet{
            indicatorView.layer.cornerRadius = 7
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setInfo(_:)), name: Notification.Name("extra"), object: nil)

         }
    @objc func setInfo(_ notification: Notification){
        let object = notification.object as! Array<Any>?
        subjectLabel.text = object?[1] as? String
        firstNameLabel.text = object?[3] as? String
        middleNameLabel.text = object?[5] as? String
        lastNameLabel.text = object?[4] as? String
        lessonTypeLabel.text = object?[2] as? String
        teacherDegree.text = object?[6] as? String
        
        
    }
    
}
