// Playground - noun: a place where people can play

import UIKit


/**************************************
* 枚举定义
**************************************/
/*
enum So meEum erati on {
// enumeration definition goes here
}
*/

enum CompassPoint{
    case w
    case s
    case n
    case e
}

let cp:CompassPoint = CompassPoint.w
// (Enum Value) 值不确定，这和C系语言不同，Swift中的枚举不必具体制定枚举成员的值





/**************************************
* 关联值
**************************************/
/*
关联值就是在定义枚举类型时给枚举绑定一个值，暂不知道有什么特殊用法或者作用
*/
enum E_Book{
    case info(String, String, Float)
}

let myBook:E_Book = .info("Swift", "Some One", 10.05)
switch myBook{
case .info(let name, let author, let price):
    println("\(name), \(author), \(price)")   // Swift, Some One, 10
    break
default:
    break
}




/**************************************
* 原始值
**************************************/
/*
原始值就是枚举在定义时赋予的值，上面说到Swift中的枚举可以不赋值去使用，当然也可以赋予原始值
*/

enum Color : String{
    case Yellow = "Yellow"
    case Red    = "Red"
    case Blue   = "Blue"
}

let myColor1 = Color.Red
let myColor2 = Color.Yellow.rawValue
println(myColor1.rawValue)   // Red
println(myColor2)   // Yellow
// 虽然被赋予原始值，但直接输出枚举值并不会输出你想要的值，原始值需要通过调用.rawValue成员才能获取


enum Week : Int{
    case Monday = 1
    case Tuesday
    case Wednesday, Thursday, Friday, Saturday, Sunday
}

println(Week.Monday.rawValue)       // 1
println(Week.Tuesday.rawValue)      // 2
println(Week.Wednesday.rawValue)    // 3
println(Week.Thursday.rawValue)     // 4
println(Week.Friday.rawValue)       // 5
println(Week.Saturday.rawValue)     // 6
println(Week.Sunday.rawValue)       // 7


if let someDay = Week(rawValue: 3){
    switch someDay{
        case .Monday:
            println("mon")
        case .Wednesday:
            println("wed")  // ⬅️
        default:
            break
    }
}
else{
    println("nil value")
}







