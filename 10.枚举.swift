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
    print("\(name), \(author), \(price)")   // Swift, Some One, 10
default: break
    
}




/**************************************
 * 原始值
 **************************************/
 /*
 原始值就是枚举在定义时赋予的值，上面说到Swift中的枚举可以不赋值去使用，当然也可以赋予原始值
 */

enum Color : String{
    case Yellow = "YellowString"
    case Red    = "RedString"
    case Blue   = "BlueString"
}

let myColor1 = Color.Blue
let myColor2 = Color.Yellow.rawValue
print(myColor1.dynamicType) // Color
print(myColor1.rawValue)    // RedString
print(myColor2)   // YellowString
// 虽然被赋予原始值，但直接输出枚举值并不会输出你想要的值，原始值需要通过调用.rawValue成员才能获取



enum Week : Int{
    case Monday = 1
    case Tuesday
    case Wednesday, Thursday, Friday, Saturday, Sunday
}

print(Week.Monday.rawValue)       // 1
print(Week.Tuesday.rawValue)      // 2
print(Week.Wednesday.rawValue)    // 3
print(Week.Thursday.rawValue)     // 4
print(Week.Friday.rawValue)       // 5
print(Week.Saturday.rawValue)     // 6
print(Week.Sunday.rawValue)       // 7


if let someDay = Week(rawValue: 3){
    switch someDay{
    case .Monday:
        print("mon")
    case .Wednesday:
        print("wed")  // ⬅️
    default:
        break
    }
}
else{
    print("nil value")
}





/**************************************
 * 递归枚举
 **************************************/
 // 就如同函数递归，递归枚举允许同类型的实例作为关联值


enum MathExpression {
    case Number(Int)
    indirect case Add(MathExpression, MathExpression)
    indirect case Mult(MathExpression, MathExpression)
    
    func test() {
        switch self {
        case .Number(let number):
            print(number)
        default:
            break;
        }
    }
}

func evaluate(expression: MathExpression) -> Int {
    switch expression {
    case .Number(let number):
        return number
    case .Add(let n1, let n2):
        return evaluate(n1) + evaluate(n2)
    case .Mult(let n1, let n2):
        return evaluate(n1) - evaluate(n2)
    }
}

let n1: MathExpression = .Number(2)
let n2: MathExpression = .Number(3)
let n3: MathExpression = .Number(1)
let r1: MathExpression = .Add(n1, n2)
let r2: MathExpression = .Mult(r1, n3)
print(evaluate(r2))








