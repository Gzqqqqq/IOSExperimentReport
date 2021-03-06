//
//  ViewController.swift
//  test10-3
//
//  Created by Guozhouqian on 2018/11/21.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    @IBAction func addView(_ sender: Any) {
        let width = Int(backView.bounds.width / 10)
        let randX = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x: randX, y: 0, width: width, height: width))
        
        label.backgroundColor = #colorLiteral(red: 0.6103215218, green: 0.9613727927, blue: 0.9741045833, alpha: 1)
        label.text = "A"
        label.textAlignment = .center
        backView.addSubview(label)
        gravity.addItem(label)
        collision.addItem(label)
    }
    @IBAction func deleteall(_ sender: Any) {
        for item in self.backView.subviews {
            if item is UILabel {
                item.removeFromSuperview()
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

