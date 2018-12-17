//: Playground - noun: a place where people can play

import PlaygroundSupport
import UIKit

//第一题：创建一个文件目录；查询是否有图片，有则加载，没有则网上下载到沙盒中
//let fileManager = FileManager.default
//if var docpath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
//    docpath.appendPathComponent("aaa")
//    if !fileManager.fileExists(atPath: docpath.path){
//        try fileManager.createDirectory(at: docpath, withIntermediateDirectories: true, attributes: nil)
//        print(docpath.path)
//    }
//    print("成功构造新的aaa文件夹")
//    docpath.appendPathComponent("0.jpg")
//    if !fileManager.fileExists(atPath: docpath.path){
//        let imageUrl = URL(string: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4198824076,697431934&fm=27&gp=0.jpg")!
//        let imageData = try! Data(contentsOf: imageUrl)
//        print(docpath.path)
//        print("不存在图片0.jpg,正在创建！！！")
//        try? imageData.write(to: docpath)
//    }
//    else{
//        print(docpath.path)
//        print("已经存在图片0.jpg！！！")
//        let imageData = try! Data(contentsOf: docpath)
//        let image = UIImage(data:imageData)
//        let imageView = UIImageView(image: image)
//        imageView.frame = CGRect(x:50, y:50, width:100, height:100)
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        view.backgroundColor = UIColor.cyan
//        view.addSubview(imageView)
//    }
//}
//
//class MyView: UIView{
//    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
//        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
//        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
//
//        UIColor.green.setFill()
//        path.fill()
//
//    }
//}
//
//let myView = MyView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//myView.backgroundColor = UIColor.clear
class TriangleView: UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        
        UIColor.green.setFill()
        path.fill()
    }
}

class MyViewController : UIViewController {
    var label: UILabel!
    var triangle:TriangleView!
    @IBAction func clicked(){
        print("I am Clicked")
        label?.text = "I am Clickd!!!"
        UIView.animate(withDuration: 1) {
            self.triangle.center = CGPoint(x: 200, y: 0)
        }
    }
    
    override func loadView() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        view.backgroundColor = UIColor.red
        
        label = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
        label.text = "Hello World!"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
        label.textAlignment = .center
        view.addSubview(label)
        
        
        let url  = URL(string: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4198824076,697431934&fm=27&gp=0.jpg")!
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
        imageView.image = image
        view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 50))
        button.setTitle("Click Me", for: .normal)
        button.addTarget(self, action: #selector(MyViewController.clicked), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        
        
        triangle = TriangleView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
        
        self.view = view
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
