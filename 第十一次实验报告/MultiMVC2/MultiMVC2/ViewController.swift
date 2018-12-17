//
//  ViewController.swift
//  MultiMVC2
//
//  Created by Guozhouqian on 2018/12/15.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var stu = Student()
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfNo.text = stu.no
        tfName.text = stu.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second"{
            stu.no = tfNo.text!
            stu.name = tfName.text!
            let secVC = segue.destination as! SecondViewController
            secVC.stu = stu
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

