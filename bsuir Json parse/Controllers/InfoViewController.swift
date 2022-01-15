//
//  InfoViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 26.11.21.
//

import UIKit
protocol MainViewControllerDelegate{
    func toggleMenu()
}

class InfoViewController: UIViewController {
    var delegate: MainViewControllerDelegate?

    @IBOutlet weak var imageDownloadIndicator: UIActivityIndicatorView!
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
        imageDownloadIndicator.startAnimating()
        NotificationCenter.default.addObserver(self, selector: #selector(setInfo(_:)), name: Notification.Name("extra"), object: nil)
         }
    
   
    func configureImage(imageURLString: String?){
        if let urlString = imageURLString{
            NetworkRequest.shared.requestData(urlString: urlString) { [weak self] result in
                switch result{
                case .success(let data):
                    let image = UIImage(data: data)
                    self?.teacherImageView.image = image
                case .failure(let error):
                    self?.teacherImageView.image = #imageLiteral(resourceName: "Teacher-PNG-Free-Image.png")
                    print("No Image :\(error.localizedDescription)")
                }
                self?.imageDownloadIndicator.stopAnimating()
            }
        } else {
            teacherImageView.image = #imageLiteral(resourceName: "Teacher-PNG-Free-Image.png")
        }
    }
    
    @objc func setInfo(_ notification: Notification){
        let object = notification.object as!
            Array<Any>?
        let imageUrl = object?[7] as? String
        let lessonType = object?[2] as? String
        teacherImageView.image = #imageLiteral(resourceName: "Teacher-PNG-Free-Image.png")
        SetUpInticatorView.shared.configureIndicatorView(lessonType: lessonType!,indicatorView: indicatorView)
        
        subjectLabel.text = object?[1] as? String
        firstNameLabel.text = object?[3] as? String
        middleNameLabel.text = object?[5] as? String
        lastNameLabel.text = object?[4] as? String
        lessonTypeLabel.text = object?[2] as? String
        teacherDegree.text = object?[6] as? String
        configureImage(imageURLString: imageUrl)
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        delegate?.toggleMenu()
    }
    
}
