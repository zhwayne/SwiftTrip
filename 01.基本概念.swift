import UIKit


// 声明变量
var v = 1;
// 声明常量
var v2 = 2;


/*********************************
*	@brief  整数
*********************************/

/*
1⃣️在 32 位平台上,Int 和 Int32 长度相同。2⃣️在 64 位平台上,Int 和 Int64 长度相同。
*/

let intMax = Int.max	// 9,223,372,036,854,775,807
let intMin = Int.min	// -9,223,372,036,854,775,808

let int8Max = Int8.max	// 127
let int8Max2 = INT8_MAX	// 127, INT_MAX 为 INT32类型

// 下面的表达式会报错，超过存储范围
// let int8Value :Int8 = Int8 + 1

// Swift支持二、八，十六进制书写
let nb = 0b1001	// 17
let no = 0o2131	// 1113
let nx = 0x11a4	// 4516





/*********************************
*	@brief  浮点数
*********************************/

/*
1⃣️Double 表示 64 位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。2⃣️Float 表示 32 位浮点数。精度要求不高的话可以使用此类型。
3⃣️Swift是类型安全的语言，不同类型的数值进行运算的事后必须进行强制类型转换
4⃣️当推测浮点数的类型时,Swift 总是会选择 Double 而不是 Float。
*/

let pi = 3 + 0.14_159	// 3.14159(Double)
let PI :Float = 3.14159	// 3.1415901184082(不准确)



/*********************************
*	@brief  类型别名
*********************************/

// 使用关键字typealisa
typealias MyDouble = Double
let myValue :MyDouble = 3.14	// 3.14(Double)



/*********************************
*	@brief  布尔值
*********************************/

let isRight = false
let isNotRight = true


/*********************************
*	@brief  元组（一个集合）
*********************************/

let HTTP404ERROR = (404, "找不到页面")
println("0 - \(HTTP404ERROR.0), 1 - \(HTTP404ERROR.1)")
// "0 - 404, 1 - 找不到页面"

// 你可以将一个元组的内容分解(decompose)成单独的常量和变量
let (errorCode, errorMsg) = HTTP404ERROR
println("\(errorCode), \(errorMsg)")	// 404, 找不到页面

// 如果你只需要一部分元组值,分解的时候可以把要忽略的部分用下划线(_)标记
let (code, _) = HTTP404ERROR
println(code)	// 404

/*
	Swift中得“_”表示忽略一个值，很多用法在后面会讲到
*/

// 你可以在定义元组的时候给单个元素命名:
let room = (no: 315, style: "寝室")		// (.0 315, .1 "寝室")
println("\(room.no), \(room.style)")	// 315, 寝室


/*********************************
*	@brief  可选表达式
*********************************/

/*
可选值的概念有点模糊，一个变量一般会有两个状态：为空，和不为空。绝大多数编程语言都如此，比如C系语言中得NULL，OC的nil，java的null。
Swift中还有另外一中类型，就是可选类型，它表示一个值可能为空，也可能不为空。
一个值可能为空也可能不为空听起来很奇怪，但其实我们早已接触并熟悉了。这有点类似其他编程语言中方法（函数）的返回值。举个例子：

char* ffip(const char* str, char ch)
{
	if(str == NULL) return NULL;

	char *p = NULL;
	for(p = str; p; p++){
		if(*p == ch) break;
	}

	if(p) return p;
	return NULL;
}
	
函数ffip(Find First Index Point)功能是在字符串str中寻找ch第一次出现的位置，返回ch的地址。
char *p = ffip("12345", 'c');
上面的函数调用返回结果p就为NULL，字符串中根本就没有'c'，如果str为“123c45”,p就不为空。这时候p就相当于一个可选值，它可能为空，可能不为空。

Swift中得可选不光是体现在函数返回值中（后面会介绍），也体现在声明和定义变量的时候。
在C语言中，声明一个int变量时，如果不进行初始化，编译器会默认给这个变量赋值为0。但Swift中不会，Swift中好像没有了基本类型，所有的类型都升级为结构体。Swift中声明一个变量或常量如果必须进行初始化，否则报错。

let a		// wrong, Type annotation missing in pattern
let a :Int	// wrong, 'let' declarations require an initializer expression
var a		// wrong, Variable 'a' used before being initialized
let a = 1	// right

但有时候，定义一个变量时并不知道该变量要赋值为什么，因为以后可能改变这个值为空。可是如果这样写会报错：

var a :Int = 0
a = nil		// wrong, Type 'Int' dose not conform protocol 'NilLiteralConvertible'

所以Swift新增了可选值这个类型，只要在原类型后面加一个'?'就可以了：Int?, String?, Double?
问号暗示包含的值是可选,也就是说可能包含 Int 值也可￼能不包含值。(不能包含其他任何值比如 Bool 值或者 String 值。只能是 Int 或者什么都没有。)
*/

var opv1 :Int?		// nil
var opv2 :Int? = 1	// {Some 1}，可选值包含两个部分，1⃣️nil 2⃣️不为空的值1
opv2 = nil			// nil

/*
1⃣️使用'!'来强制取出可选值中不为空的部位
2⃣️使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非 nil 的值。
3⃣️nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失 的情况,请把它们声明成对应的可选类型。
*/
var opv3 :Int?	// nil
opv3 = 1		// {Some 1}
var opv4 = 1 + opv3!	// 2
var opv5 = opv3		// {Some 1} 自动推导为可选类型

/*
有时候在程序架构中,第一次被赋值之后,可以确定一个可选总会有值。在这种情况下,每次都要判断和解析可选值是非常低效的,因为可以确定它总会有值。 这种类型的可选被定义为隐式解析可选(implicitly unwrapped optionals)。把想要用作可 选的类型的后面的问号(String?)改成感叹号(String!)来声明一个隐式解析可选。
*/
var opv6 :Int! = 123
println(opv6)	// 123，不需要'!'取值



/*********************************
*	@brief  可选绑定
*********************************/
/*
使用可选绑定(optional binding)来判断可选是否包含值,如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在 if 和 while 语句中来对可选的值进行判断并把值赋给一 个常量或者变量。
*/
var pi_Str = "315"
if let pi_Int = pi_Str.toInt() {
	println("\(pi_Str) has an Int value \(pi_Int)")
}
else{
	println("\(pi_Str) cannot be converted to Int")
}


// 上面的类似于：（注意区别）
var pi_Str1 = "315"
let pi_Int1 = pi_Str1.toInt()
if(pi_Int1 != nil){
	println("\(pi_Str1) has an Int value \(pi_Int1!)")
}
else{
	println("\(pi_Str1) cannot be converted to Int")
}



/*********************************
*	@brief  断言调试
*********************************/
let value8403 = -1
assert(value8403 <= 0, "value8403必须≤0") // 条件符合，不会触发
