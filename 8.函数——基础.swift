// Playground - noun: a place where people can play

import UIKit

/*******************************
 *	一般形式
 ******************************/
func sayHello() {
    println("hello")
}

func add(num1 :Int, num2 :Int) -> Int{
    return num1 + num2
}

sayHello()  // hello
let v1 = add(1, 2)  // 3

// 返回多个值——元组
func getError() -> (msg:String, code:Int){
    return ("找不到网页", 404)
}

println(getError()) // (找不到网页, 404)



/*******************************
 *	外部参数形式
 ******************************/
func plus(firstNum num1:Int, secondNum num2:Int) -> Int{
    return num1 + num2
}

plus(firstNum: 1, secondNum: 2) // 3

func minus(#num1:Int, #num2:Int) -> Int{
    return num1 - num2
}

minus(num1: 3, num2: 2) // 1



/*******************************
 *	设置默认值
 *  Swift 为带默认值的形参提供了外部形参名,当调用该函数的时候,外部形 参名必须让形参的目的明确无歧义
 ******************************/
func catStr(#str1:String, #str2:String, connector:String = ".") -> String{
    return str1 + connector + str2
}

catStr(str1: "zh", str2: "wayne", connector: " ") // zh wayne
catStr(str1: "zh", str2: "wayne")   // zh.wayne





/*******************************
 *	可变形参
 ******************************/
func calcTotal(nums:Int ...) -> Int{
    var total:Int = 0
    for item in nums{
        total += item
    }
    
    return total
}

calcTotal(1, 2, 3, 4)   // 10




/*******************************
 *	常量形参，变量形参
 *  一半来说，形参是不能改变值的，除非形参为变量形参
 ******************************/
func zizeng(var num:Int){
    ++num
}



/*******************************
 *	In-Out形参 (类似指针操作)
 ******************************/
func swapTwoNum(inout #a:Int, inout #b:Int){
    a ^= b; b ^= a; a ^= b
}

var a = 1, b = 2
swapTwoNum(a: &a, b: &b)
println("a = \(a), b = \(b)")   // a = 2, b = 1

