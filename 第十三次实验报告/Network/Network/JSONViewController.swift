//
//  JSONViewController.swift
//  Network
//
//  Created by Guozhouqian on 2018/12/17.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit
import Alamofire

class JSONViewController: UIViewController {
    
    let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101270101")!
    var citys:[String:Any]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loadWithURL(_ sender: Any) {
        if let data = try? Data(contentsOf: url){
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]{
                let str:[String:String] = json["cityInfo"] as! [String:String]
                print(str["city"] ?? "")
                print(json["data"] ?? "")
            }
        }
    }
    
    @IBAction func loadWithSession(_ sender: Any) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]{
                self.citys = json
                /*let str:[String:String] = json["cityInfo"] as! [String:String]
                print(str["city"] ?? "")
                print(json["data"] ?? "")*/
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "ShowCityList", sender: self)
                }
            }
        }
        task.resume()
    }
    
    @IBAction func loadWithAF(_ sender: Any) {
        AF.request(url).responseJSON { (response) in
            self.citys = response.value as? [String:Any]
           /* let str:[String:String] = json["cityInfo"] as! [String:String]
            print(str["city"] ?? "")
            print(json["data"] ?? "")*/
            self.performSegue(withIdentifier: "ShowCityList", sender: self)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowCityList" {
            if let secVC = segue.destination as? PersonsTableViewController {
                secVC.citys = self.citys
            }
        }
    }
    

}
