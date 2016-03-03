import Foundation
import UIKit


/*****************************
 * 函数类型
 *****************************/
func add(num1:Int, num2:Int) -> Int{
    return num1 + num2
} // 上面的函数类型为 (Int, Int)->Int

func sayHi(){
    print("hi")
} // 函数类型为 ()->()


// 定义函数类型
var myFuncType: (Int, Int) -> Int = add
myFuncType(1, 2) // 3

// 这相当于给函数指定一个引用，有点类似于C中的函数指针
// 具有相同函数类型的变量可以相互赋值
var otherFuncType = myFuncType
otherFuncType(1, 2) // 3


// 函数类型也可以作为参数，形同回调函数
func comp(num1 num1:Int, num2:Int) -> Bool{
    return num1 > num2 ? true : false
}

func findMax(nums nums:[Int], inFunc:(Int, Int) -> Bool) -> Int{
    var max:Int? = Int.min
    for item in nums{
        if(inFunc(item, max!)){
            max! = item
        }
    }
    return max!
}

let max = findMax(nums: [3, 5, 7, 2], inFunc: comp)
print(max)    // 7




/*****************************
* 嵌套函数
*****************************/
// 嵌套函数就是函数中有函数，它一般返回一个函数类型：
func weather(rain rain:Bool) -> (String) -> (){
    func umbrellas(color color:String){
        print("撑雨伞" + color);
    }
    
    func other(color color:String){
        print("不撑伞" + color);
    }
    
    return rain ? umbrellas : other;
}

var funcType = weather(rain: true);
funcType("yellow"); // 撑雨伞yellow




/*****************************
* 闭包
*****************************/
/* 函数其实就是一种特殊的闭包，表达式：
{ (parameters) -> return type in
statements
}
*/



func func1(num:Int) -> Bool{
    print("func1:\(num)")
    
    return true
}

func func2(num:Int, function:(Int) -> Bool){
    print("func2:\(num)");
    function(1)
}

func2(2, function: func1)


func2(2, function: { (a) -> Bool in
    print("func1:\(a)")
    return true
})


// 由上可见，闭包就是函数类型的一种应用方式
// 模拟网络操作:
func loadImage(url:String, closure:(NSData?) -> Void){
    let url:NSURL = NSURL(string: url)!
    let data = NSData(contentsOfURL: url)
    print(data!.length)
    closure(data)
}
//
loadImage("http://e.hiphotos.baidu.com/image/w%3D400/sign=08fc1b28e5cd7b89e96c3b833f264291/b151f8198618367a064f643f2d738bd4b21ce50a.jpg", closure: { (data) -> Void in
    
    var imageView = UIImageView(frame: CGRectMake(0, 0, 200, 120))
    imageView.image = UIImage(data: data!)
})

