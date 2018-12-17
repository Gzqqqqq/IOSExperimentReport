//
//  ViewController.swift
//  MultiMVC3
//
//  Created by Guozhouqian on 2018/12/15.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second" {
            let secVC = segue.destination as! SecondViewController
            secVC.no = tfNo.text!
            secVC.name = tfName.text!
        }
    }

    @IBAction func backRoot(segue:UIStoryboardSegue){
        let secVC = segue.source as! SecondViewController
        tfNo.text = secVC.no
        tfName.text = secVC.name
        
    }
}

