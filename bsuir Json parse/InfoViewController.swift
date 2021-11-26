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
    
    @IBOutlet weak var indicatorView: UIView!{
        didSet{
            indicatorView.layer.cornerRadius = 7
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
}
