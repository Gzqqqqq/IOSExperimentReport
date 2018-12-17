//
//  FirstViewController.swift
//  HelloWorld
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var lable:UILabel! = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow
        self.title = "First"
        
        lable = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        lable.text = "hello World"
        //控制居中
        lable.textAlignment = .center
        lable.center = self.view.center
        //添加到view中
        self.view.addSubview(lable)
        
        
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 50))
        button.setTitle("Click Me", for: .normal)   //平常状态
        button.setTitle("I am Clicking", for: .highlighted)  //正在点击状态
        button.setTitleColor(UIColor.green, for: .normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
    
    @IBAction func btnClicked(){
//        present(SecondViewController(), animated: true, completion: nil)
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
        lable.text = "I am Clicked!!"
    }

    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
