//
//  ViewController.swift
//  test10-1
//
//  Created by Guozhouqian on 2018/11/21.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func btnClicked(_ sender: Any) {
        UIView.animate(withDuration:2,delay:1,options:[.curveEaseInOut,.autoreverse,.repeat],animations:{
            self.myView.alpha = 0
            self.myView.center.x = self.view.bounds.width
            self.myView.backgroundColor = #colorLiteral(red: 0.6080191446, green: 0.9232503658, blue: 1, alpha: 1)
            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)
        }) {(finished) in
            if finished {
                self.myView.removeFromSuperview()
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

