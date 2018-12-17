//: Playground - noun: a place where people can play

import UIKit
import Darwin
//1.
print("第1题")
var dicArr :[[String:Any]] = [["name":"Alice","age":18],["name":"David","age":19]]
//方法一：
var nameArr = dicArr.map({ $0["age"] })   //map不能自动解包
print(nameArr)
var nameArr1 = dicArr.map({ $0["age"]! }) //感叹号解包
print(nameArr1)
//方法二：
//var nameArr2 = dicArr.flatMap { $0["name"] }
//print(nameArr2)


//2.
print("------------------------------------")
print("第2题")
var myStr = ["123","12w","ttt"]
//方法一：
var res_int1 = myStr.filter{ Int($0) != nil }
print(res_int1)
//方法二：
//var res_int2 = myStr.flatMap { Int($0) }
//print(res_int2)

//3.
print("------------------------------------")
print("第3题")
var strArr = ["li","gui","yang"]
var res_str = strArr.reduce("",{ $0+$1+"," })
print(res_str)

//4、
print("------------------------------------")
print("第4题")
var str1 = [10,4,2,1,24,45]
let temp = str1.reduce((max:Int.min,min:Int.max,sum:0))
{   (temp,i) in
    return (max(temp.max,i),min(temp.min,i),temp.sum+i)
}

print("max:\(temp.max)")
print("min:\(temp.min)")
print("sum:\(temp.sum)")



//5、筛选函数数组
print("------------------------------------")
print("第5题")
func one()->Void
{
    print("返回值为空")
}

func two()->Int
{
    return 2
}

func three(max:Int)->Int
{
    return 3
}
func four(max:Int)->Void
{
    print("返回值为空，参为整数")
}
func five(max:Int,min:Int)->Void
{
    print("返回值为空，参为整数")
}
var arr6:[Any]=[one,two,three,four,five]

for (key,value) in arr6.enumerated()
{
    if value is (Int)->Int
    {
        print("下标为\(key)的函数是参数为整数，返回值也是整数")
    }
}


//6.
print("------------------------------------")
print("第6题")
extension Int{
    func Sqrt() -> Double{
        return Darwin.sqrt(Double(self))
    }
}
var Num:Int = 9
print(Num.Sqrt())


//7.
print("------------------------------------")
print("第7题")
func returnValue<T :Comparable>(arr :[T]) -> (min:T,max:T){
    var min = arr[0]
    var max = arr[0]
    for i in arr{
        if i > max{
            max = i
        }else if i < min{
            min = i
        }
    }
    return (min,max)
}

print("输入整数：")
var arr1:[Int] = [123,12,-1,-67,222,0]
print(returnValue(arr: arr1))

print("输入字符串：")
var arr2 = ["123","12","-1","-67","222","0"]
print(returnValue(arr: arr2))

print("输入浮点数：")
var arr3 = [123.0,12.0,-1.0,-67.0,222.0,0.0]
print(returnValue(arr: arr3))
