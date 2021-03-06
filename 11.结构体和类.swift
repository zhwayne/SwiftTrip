// Playground - noun: a place where people can play

import UIKit
import Foundation


/*********************************
 * 结构体和类
 *********************************/
class MyClass {
    var v1 = 1
    var v2 :Int?
    
    func sayHi(name: String) -> Self {
        v2 = 2
        print("Hi, \(name)")
        return self
    }
}

struct MyStruct {
    var v1 = 1
    var v2 :Int?
    
    // 参考后面的 mutating 关键字说明
    mutating func sayHi(name: String) -> MyStruct {
        v2 = 2
        print("Hi, \(name)")
        return self
    }
}

var c1 = MyClass()
var c2 = MyStruct()

c1.sayHi("a").v2   // Hi, a // 2
c2.sayHi("b").v2   // Hi, b // 2

// 可见结构体和类非常类似，结构体可以完成类的绝大多数工作。
// 区别：
//      1⃣️结构体是值类型，类是引用类型
//      2⃣️类可以继承，结构体不能






/*********************************
* 结构体和类的初始化
*********************************/
struct BookStruct {
    var name    :String
    var price   :Double
    var author  :String
    
    
    init(_ name: String, _ price :Double, _ author :String){
        self.name = name;
        self.price = price;
        self.author = author
    }
    
    init(){
        name = "Unknow"
        price = 0
        author = "Unknow"
    }
    
    func description(){
        print("<\(self):name = \(name), price = \(price), author = \(author)>")
    }
}

var book1 = BookStruct()
book1.description()
// <__lldb_expr_1841.BookStruct:name = Unknow, price = 0.0, author = Unknow>

let book2 = BookStruct("Swift", 27.5, "Petter")
book2.description()
// <__lldb_expr_1940.BookStruct:name = Swift, price = 27.5, author = Petter>

// 类差不多，略过





/*********************************
* 属性
*********************************/
// 存储属性，就是普通的数据成员
// 计算属性，这玩意儿很有意思，其本身并不存储值，其值由其他存储属性计算而来，有点响应式编程的影子

class Circle {
    var radius :Double = 0
    class var pi :Double{
        get{
            return 3.1415926
        }
    }
    // 或者 static let pi = 3.1415926
    
    
    var diameter :Double{
        set{
            radius = newValue / 2
        }
        get{
            return radius * 2
        }
    }
    
    var area :Double{
        set{
            radius = sqrt((newValue / Circle.pi))
        }
        get{
            return pow(radius, 2) * Circle.pi
        }
    }
    
    var perimeter :Double{
        set{
            radius = newValue / Circle.pi / 2
        }
        get{
            return 2 * Circle.pi * radius
        }
    }
    
    init(){}
    
    init(_ radius :Double){
        self.radius = radius;
    }
}

var cir = Circle(2)
print(cir.area)   // 12.56637
cir.diameter = 3
print(cir.radius) // 1.5
print(cir.area)   // 7.06858



// 属性监视器
// 这是一个很有用的东西，类似OC中的观察者
class A{
    var a :Int = 0{
        willSet{
            print("a 即将变成 \(newValue)")
        }
        didSet{
            print("a 已经变成 \(a)")
            // 这里还可以做点什么
            
        }
    }
}


var ca = A()
ca.a = 1
// a 即将变成 1
// a 已经变成 1







/*********************************
* 方法
*********************************/
// 值类型的方法中不允许改变其属性，除非加关键字mutating
struct B{
    var a = 0
    
    func doSomething(){
        // ++a; 报错
    }
    
    mutating func doSomthing2(){
        a++
    }
}

var sb = B()
print(sb.a)   // 0
sb.doSomthing2()
print(sb.a)   // 1


// 类方法 在函数前面加class 结构体枚举则加static





/*********************************
* 下标
*********************************/
// 类和结构体的下标用于返回指定 Index 的值，它的具体行为类似以计算属性
// 由 get 和 set 方法实现


struct Book {
    var name: String?
    var author: String?
    var pages: Int = 0
    var price: Double = 0.0
    
    init() {
        name = nil
        author = nil
        pages = 0
        price = 0.0
    }
    
    init(aName: String, aAuthor: String, aPages: Int, aPrice: Double) {
        name = aName
        author = aAuthor
        pages = aPages
        price = aPrice
    }
    
    subscript(inPage: Int) -> Int {
        return inPage
    }
    
    // 结构体下标里不允许修改属性, 而类的则可以
    subscript(numbers numbers: UInt, discount discount: Double) -> Double {
        return price * Double(numbers) * discount
    }
}

let book = Book(aName: "Swift", aAuthor: "Some one", aPages: 300, aPrice: 123.99)
let pageNow = book[47]  // 47
let totalMoney = book[numbers: 9, discount: 0.79]   // 881.5688999999999








