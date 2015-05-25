import UIKit

/******************
*	字符
*****************/
let ch1 :Character = "a"
// 字符和字符串都是用""包含的，在声明Character时需显示指定变量类型，否则Swift默认推导为String类型


// Swift字符串也可以指定Unicode字符（\u{code}）
let uc1 :Character = "\u{1234}"	// ሴ

// 不光能指定一个特殊字符，还能指定某个字的部首
let uc2 :Character = "\u{e9}"	// é
let uc3 :Character = "\u{65}\u{301}"	// é（e和 ́组合而成）

let uc4 :Character = "\u{d55c}"	// 한
let uc5 :Character = "\u{1112}\u{1161}\u{11ab}"	// 한（ᄒ, ᅡ, ᆫ）

// 组合图案
let u6 :Character = "\u{1F1e8}\u{1F1f3}"	// 🇨🇳

/******************
*	字符比较
*****************/
let u7:Character = "1"
let u8:Character = "1"
let u9:Character = "a"
let b1 = u7 == u8	// true
let b2 = u7 == u9	// false


/******************
*	字符串
*****************/

let str1 = "abc"
let str2 = String("123")
let str3 = str1 + str2	// abc123


/******************
*	字符串比较
******************/
let str4 = "123"
let str5 = "123"
let str6 = "abc"
let b3 = str4 == str5	//true
let b4 = str4 == str6	// false


// 注意：字符串是值类型，和Int等类型一样，这和Cocoa中的NSString是不同的。

var str7 = "123"	// 123
var str8 = str7		// 123
str8 = "abc"		// abc
println(str7)		// 123

