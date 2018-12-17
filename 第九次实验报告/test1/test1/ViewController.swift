//
//  ViewController.swift
//  test1
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

    @IBAction func add(_ sender: UIButton) {
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 50, height: 50))
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 1, green: 0.694814277, blue: 0.7656143615, alpha: 1)
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 10, height: 10)
        label.layer.shadowOpacity = 1
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        label.addGestureRecognizer(pinchRecognizer)
        label.isUserInteractionEnabled = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        label.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        
        
        //旋转
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(recognizer:)))
        label.addGestureRecognizer(rotationRecognizer)
        
        self.view.addSubview(label)
    }
    
    @objc func rotation(recognizer: UIRotationGestureRecognizer) {
        //设置旋转弧度
        recognizer.view?.transform = (recognizer.view?.transform.rotated(by: recognizer.rotation))!
        
        //将上一次弧度设置为1
        recognizer.rotation = 0
    }
    
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            recognizer.view!.bounds.size = CGSize(width: recognizer.view!.bounds.width * recognizer.scale, height: recognizer.view!.bounds.height * recognizer.scale)
            recognizer.scale = 1
        default:
            break
        }
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
        }
    }
    
    @IBAction func move(_ sender: UIButton) {
        for label in self.view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    label.center = CGPoint(x: x, y: y)
                }
            }
        }
    }
    
    
    @IBAction func deleteView(_ sender: UIButton) {
        for label in self.view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
    
}

