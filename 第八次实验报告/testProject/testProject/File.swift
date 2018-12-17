//
//  File.swift
//  testProject
//
//  Created by Guozhouqian on 2018/11/1.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import Foundation

enum Gender:String{
    case female
    case male
}

class Person{
    //存储属性
    var firstName : String
    var lastName : String
    var age : Int
    var gender:Gender
    
    //计算属性
    var fullName : String{
        get{
            return firstName+""+lastName
        }
    }
    
    //指定构造函数
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName=lastName
        self.age = age
        self.gender = gender
    }
    
    //便利构造函数
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female)
    }
    
    var description:String{
        return"Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
}

class Student:Person{
    var  stuNo:String
    
    //指定构造函数
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)//调用的是指定构造函数
    }
    //便利构造函数
    convenience init(name:String){
        self.init(firstName: name,lastName: "",age: 18,gender: Gender.female,stuNo: "001")
    }
    
    override var description: String{
        return super.description + " stuNo:\(stuNo)"
    }
}

class Teacher:Person{
    var title:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender:gender)
    }
    
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 18, gender: Gender.female, title: "teacher")
    }
    
    override var description: String{
        return super.description+" title:\(title)"
    }
}
