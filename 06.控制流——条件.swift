// Playground - noun: a place where people can play

import UIKit

/**************************
 *  If
 *************************/
if 1 < 2{
    println("true")
}

if 2 < 1{
    println("false")
}
else{
    println("true")
}

if 2 <= 3{
    println("true")
}
else if 2 < 3{
    println("true")
}
else{
    println("other")
}


var str1 :String? = "315"
if let pi = str1!.toInt(){
    print(pi)
}
else{
    print("other result")
}// 315




/**************************
*  Switch
*************************/
let v1 = 88
switch v1{
case 1:
    println(1)
case 2:
    println(2)
case 3, 4, 5:
    println("some value")
case 6...9:
    println("in area")
case _:
    println("uhh, shit")
default:
    println("default")
}

// swift的switch不允许在case后面紧接着添加花括号，且必须有default或者case _:语句
// 上例中 case _: 拦截了default语句


// 其他用法1
let v2 = (1, 2)
switch v2{
case (0, 0):
    println("0, 0")
case (1, 0):
    println("1, 0")
case (1, _):
    println("1, _")
case (_, 2):
    println("_, 2")
case (_, _):
    println("_, _")
case _:
    println("😄")
default:
    println("default")
}
// 最后3个等价


// 其他用法2
let v3 = (1, 2)
switch v3{
case let (x, 1):
    println(x)
case let (x, 2):
    println(x)  // ⬅️
default:
    println("defaule")
}


// 用法3
let v4 = (2, 3)
switch v4{
case let (x, y) where x == y:
    println("x = y")
case let (x, y) where x == y - 1:
    println("x = y - 1") // ⬅️
default:
    break  // 什么都不做
}















