//: Playground - noun: a place where people can play

import UIKit

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
        super.init(firstName: firstName, lastName: lastName, age: age, gender: Gender.male)
    }
    
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 18, gender: Gender.female, title: "teacher")
    }
    
    override var description: String{
        return super.description+" title:\(title)"
    }
}

let p1 = Person(firstName: "guo", lastName: "zhouqian", age: 20, gender: Gender.female)// 使用指定构造函数构造的对象
let p2 = Person(name: "guozhouqian")//使用便利构造函数构造的对象
print(p1.description)
print(p2.description)

//重新方法如下：
func == (left:Person,right:Person)->Bool{
    return left.firstName==right.firstName && left.lastName==right.lastName && left.age == right.age && left.gender == right.gender
}

func != (left:Person,right:Person)->Bool{
    return left.firstName != right.firstName || left.lastName != right.lastName || left.age != right.age || left.gender != right.gender
}

//比较一
if p1 == p2 {
    print("两个对象比较相等")
}else{
    print("两个对象比较不相等")
}

//比较二
if p1 != p1 {
    print("两个对象比较不相等")
}else{
    print("两个对象比较相等")
}

let s1 = Student(firstName: "guo", lastName: "zhouqian", age: 20, gender: Gender.female, stuNo: "013")
let s2 = Student(name: "guozhouqian")
print(s1.description)
print(s2.description)

let t1 = Teacher(firstName: "li", lastName: "guiyang", age: 40, gender: Gender.male, title: "headTeacher")
let t2 = Teacher(name: "liaoxuehua")
print(t1.description)
print(t2.description)

var persons = [Person]()
persons.append(p1)
persons.append(p2)
persons.append(s1)
persons.append(s2)
persons.append(t1)
persons.append(t2)
var stuNum = 0
var teaNum = 0
var perNum = 0
for i in 0..<persons.count{
    if persons[i] is Student{
        stuNum += 1
    }else if persons[i] is Teacher{
        teaNum += 1
    }else{
        perNum += 1
    }
}

//字典
var perDic: [String:Int] = ["Person":perNum,"Teacher":teaNum,"Student":stuNum]

for (key, value) in perDic {
    print("字典 key \(key) -  字典 value \(value)")
}

//数组排序
persons.sort(by: { $0.age > $1.age})  //age排序
persons.sort(by: { $0.fullName > $1.fullName})  //fullName排序
//persons.sort(by: {$0.age > $1.age && $0.gender.rawValue > $1.gender.rawValue })  //gender+age排序
persons.sort {    //gender+age排序
    if $0.age == $1.age{
        return $0.gender.rawValue > $1.gender.rawValue
    }
    else{
        return $0.age > $1.age
    }
}

