//
//  WebViewController.swift
//  bsuir Json parse
//
//  Created by Mikhail Skuratov on 16.01.22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text = "Батин"
             NotificationCenter.default.addObserver(self, selector: #selector(configureText(_:)), name: Notification.Name("link"), object: nil)
        if let text = text {
                           if let search = URL(string: "https://www.google.com/search?q=\(text)bsuir"){
                               let field = URLRequest(url: search)
                               webView.load(field)
                           }
                       }
      
    }
    @objc func configureText(_ notification: Notification){
        text = (notification.object as! String)
    }
    
@IBAction func forwardButtonAction(_ sender: UIButton) {
    webView.goForward()
    }
       
@IBAction func backButtonAction(_ sender: UIButton) {
    webView.goBack()
    }
       
@IBAction func refreshButtonAction(_ sender: UIButton) {
    webView.reload()
    }



}
