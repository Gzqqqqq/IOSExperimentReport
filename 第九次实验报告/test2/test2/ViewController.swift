//
//  ViewController.swift
//  test2
//
//  Created by Guozhouqian on 2018/11/7.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func actionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: "ActionSheet", message: "choose Color?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "red", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.red
        }))
        
        alert.addAction(UIAlertAction(title: "yellow", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.yellow
        }))
        
        alert.addAction(UIAlertAction(title: "blue", style: .destructive, handler: { (action) in
            self.view.backgroundColor = UIColor.blue
        }))
        
        alert.addAction(UIAlertAction(title: "White", style: .cancel, handler: { (action) in
            self.view.backgroundColor = UIColor.white
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func alert(_ sender: UIButton) {
        let alert = UIAlertController(title: "alert", message: "Login message", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            guard let username = alert.textFields?.first?.text, let password = alert.textFields?.last?.text else{
                return
            }
            
            print("username=\(username) password=\(password)")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("取消登陆！！！")
        }))
        
        alert.addTextField { (textField) in
            textField.placeholder = "your username"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "your password"
            textField.isSecureTextEntry = true
        }
        
        present(alert, animated: true, completion: nil)
    }
}

