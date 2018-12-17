//
//  PersonViewController.swift
//  Network
//
//  Created by Guozhouqian on 2018/12/17.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var shidu: UILabel!
    @IBOutlet weak var pm25: UILabel!
    @IBOutlet weak var pm10: UILabel!
    @IBOutlet weak var quality: UILabel!
    @IBOutlet weak var wendu: UILabel!
    @IBOutlet weak var ganmao: UILabel!
    var city:[String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let str:[String:Any] = city?["data"] as! [String:Any]
        
        shidu.text = str["shidu"] as? String
        pm25.text = "\(str["pm25"] ?? "")"
        pm10.text = "\(str["pm10"] ?? "")"
        quality.text = str["quality"] as? String
        wendu.text = str["wendu"] as? String
        ganmao.text = str["ganmao"] as? String
        print(str["pm25"] ?? "")
        print(str["pm10"] ?? "")
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
