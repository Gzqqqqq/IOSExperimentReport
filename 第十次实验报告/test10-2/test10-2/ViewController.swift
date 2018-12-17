//
//  ViewController.swift
//  test10-2
//
//  Created by Guozhouqian on 2018/11/21.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView1: UIView!
    @IBOutlet weak var myView2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func btnClicked1(_ sender: Any) {
        UIView.transition(with: myView1, duration: 2, options: .transitionCurlUp, animations: {
            self.myView1.backgroundColor = #colorLiteral(red: 1, green: 0.694814277, blue: 0.7656143615, alpha: 1)
        }, completion: nil)
    }
    
    
    @IBAction func btnClicked2(_ sender: Any) {
        let imageView = UIImageView(frame: CGRect(x: 70, y: 300, width: 235, height: 100))
        imageView.image = UIImage(named: "iamge")
        UIView.transition(from: myView2, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

