//
//  ViewController.swift
//  Thread
//
//  Created by Guozhouqian on 2018/12/15.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumlabel: UILabel!
    @IBOutlet weak var timerlabel: UILabel!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.timerlabel.text = "time:\(self.count)"
            print("timer thread:\(Thread.current)")
        }
    }
    
    @IBAction func sumClick(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            print("Run thread:\(Thread.current)")
            for i in 1...999999999{
                sum += i
            }
            DispatchQueue.main.async {
                self.sumlabel.text = "sum:\(sum)"
            }
        }
    }


}

