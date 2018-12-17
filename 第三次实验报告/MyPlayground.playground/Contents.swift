//: Playground - noun: a place where people can play

import UIKit

//获取当前时间
let now = Date()  //Date对象其本身使用的时区是零时区。 有时差，我们处于东8区，要加上8个小时
//创建一个DateFormatter来作为转换的桥梁
let dateFormatter = DateFormatter()

//设置时间格式（这里的dateFormatter对象在上一段代码中创建）
dateFormatter.dateStyle = DateFormatter.Style.full
dateFormatter.timeStyle = DateFormatter.Style.short
//设置时间位置为中国
dateFormatter.locale = Locale(identifier: "zh_CN")
//DateFormatter对象的string方法执行转换(参数now为之前代码中所创建)
var convertedDate0 = dateFormatter.string(from: now)
//输出转换结果
print("\(convertedDate0)")  //结果为：下午3:00:00 | 2018年5月12日 星期日

//print("第二题----字符串的处理：")
//var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
//print("输出6到20的字符：")
//print(str[str.index(str.startIndex,offsetBy:6)..<str.index(str.startIndex,offsetBy: 21)])
//var flag = true
//
//while(flag) {
//    if str.contains("OS") {
//        str.removeSubrange(str.range(of: "OS")!)
//    }else{
//        flag = false
//    }
//}
//print("输出删除OS后的字符串：")
//print(str)
//
//print("第三题----将字典存入沙盒")
let fileManager = FileManager.default
//var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//print(url.path)
//let dictionary = [convertedDate0:str] as AnyObject
//url.appendPathComponent("text.txt")
//try! dictionary.write(to: url)

//print("第四题----网上图片存入沙盒")
//let imageUrl = URL(string: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4198824076,697431934&fm=27&gp=0.jpg")!
//let imageData = try! Data(contentsOf: imageUrl)
//let image = UIImage(data:imageData)
//var imageLocalUrl = fileManager.urls(for: .documentDirectory,in: .userDomainMask).first!
//print(imageLocalUrl.path)
//imageLocalUrl.appendPathComponent("1.jpg")
//try? imageData.write(to: imageLocalUrl)

print("第五题----解析json文件，内容如下：")
let weatherUrl = URL(string: "http://www.weather.com.cn/data/sk/101010100.html")!
let weatherData = try! Data(contentsOf: weatherUrl)
let jsonObject = try! JSONSerialization.jsonObject(with: weatherData, options: .allowFragments)
if let dic = jsonObject as? [String:Any]{
    if let weatherDic = dic["weatherinfo"] as? [String:String]{
        print("city的值为："+weatherDic["city"]!)
        print("cityid的值为："+weatherDic["cityid"]!)
        print("temp的值为："+weatherDic["temp"]!)
        print("WD的值为："+weatherDic["WD"]!)
        print("WS的值为："+weatherDic["WS"]!)
        print("SD的值为："+weatherDic["SD"]!)
        print("AP的值为："+weatherDic["AP"]!)
        print("njd的值为："+weatherDic["njd"]!)
        print("WSE的值为："+weatherDic["WSE"]!)
        print("time的值为："+weatherDic["time"]!)
        print("sm的值为："+weatherDic["sm"]!)
        print("isRadar的值为："+weatherDic["isRadar"]!)
        print("Radar的值为："+weatherDic["Radar"]!)
    }
}
