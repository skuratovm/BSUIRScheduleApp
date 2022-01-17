//
//  StartViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 21.12.21.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var groupTextField: UITextField!{
        didSet{
            groupTextField.layer.cornerRadius = groupTextField.frame.height / 2
        }
    }

    @IBOutlet weak var logoImageView: UIImageView!{
        didSet{
            logoImageView.layer.cornerRadius = logoImageView.frame.height / 4
            logoImageView.image = #imageLiteral(resourceName: "unnamed (2).jpeg")
        }
    }
    @IBOutlet weak var enterGroupButton: UIButton!{
        didSet{
            enterGroupButton.layer.cornerRadius = enterGroupButton.frame.height / 4
            enterGroupButton.setTitle("Продолжить", for: .normal)
            enterGroupButton.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
    
    
    @IBAction func enterGroupButtonAction(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "scheduleVC") else { return  }
        let groupNumber = groupTextField.text ?? ""
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name("data"), object: groupNumber)
    }
    


}
