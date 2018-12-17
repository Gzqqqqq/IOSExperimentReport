//
//  ViewController.swift
//  Network
//
//  Created by Guozhouqian on 2018/12/16.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit
import Alamofire

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func loadWithURL(_ sender: Any) {
        DispatchQueue.global().async {
            if let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544971150502&di=070b9e580faa64c6451c6562e2765794&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fa2%2F152%2Fd%2F305.jpg"){
                
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.imageView1.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    @IBAction func loadWithSession(_ sender: Any) {
        if let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545571246&di=5a06439766cbced2ff6e312b30f0981c&imgtype=jpg&er=1&src=http%3A%2F%2Fimg2.3lian.com%2F2014%2Fc7%2F3%2Fd%2F65.jpg"){
            
            // 自动创建一个线程去加载图片
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async { //手动加载到main界面
                    self.imageView2.image = UIImage(data: data!)
                }
            }
            task.resume()
        }
    }
    @IBAction func loadWithAF(_ sender: Any) {
        if let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544971150502&di=070b9e580faa64c6451c6562e2765794&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fa2%2F152%2Fd%2F305.jpg"){
            
            AF.request(url).responseData { (response) in
                self.imageView2.image = UIImage(data: response.data!)
            }
        }
    }
    
}

