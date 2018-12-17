//
//  ViewController.swift
//  WebView
//
//  Created by Guozhouqian on 2018/12/15.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//


import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://www.163.com") {
            print("aaaaa")
            webView.load(URLRequest(url: url))
            //            webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        }
    }
    
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: text.text ?? "") {
            webView.load(URLRequest(url: url))
        }
    }
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
}
