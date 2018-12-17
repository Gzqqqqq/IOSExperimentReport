//
//  ViewController.swift
//  MultiMVC
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

    
//    第一种传值的方法-----利用共有的student对象正向反向传值
    @IBAction func showSecondMVC(_ sender: Any) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
        
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        secVC.stu = stu
        
        //利用导航跳转----销毁用pop
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    
    @IBAction func showThirdMVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
//        self.navigationController?.pushViewController(thirdVC, animated: true)
        //利用module跳转----销毁用dismiss
        present(thirdVC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

