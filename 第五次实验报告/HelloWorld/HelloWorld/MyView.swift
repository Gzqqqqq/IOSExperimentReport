//
//  MyView.swift
//  HelloWorld
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class MyView: UIView {

    
    // 圆、椭圆
    override func draw(_ rect: CGRect) {
        let color = UIColor.white
        color.set() // 设置线条颜色
        // 根据传人的矩形画出内切圆／椭圆
        let aPath = UIBezierPath(ovalIn: rect) // 如果传入的是正方形，画出的就是内切圆
      //let aPath = UIBezierPath(ovalIn: rect) // 如果传入的是长方形，画出的就是内切椭圆
        
        aPath.lineWidth = 3.0 // 线条宽度
        aPath.stroke() // Draws line 根据坐标点连线，不填充
        //aPath.fill() // Draws line 根据坐标点连线，填充
    }
    

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
