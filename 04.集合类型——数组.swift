// Playground - noun: a place where people can play

import UIKit

// Swift中的数组和其他语言一样，不同于OC的是，数组中的元素并不是必须为class，基本类型也可以保存在数组中。

let arr1: [Int] = [1, 2, 3]					// [1, 2, 3]
let arr2: [Character]? = ["a", "b", "c"]	// [a, b, c]

println("\(arr1[1])" + "\(arr2![2])")		// 2c


// 数组可以直接用+=添加新项
var arr3 = [1, 2, 3]	// [1, 2, 3]
arr3 += [4, 5, 6]		// [1, 2, 3, 4, 5, 6]
arr3.append(7)			// [1, 2, 3, 4, 5, 6, 7]



// 也可利用下标改变一批数据
var arr4 = ["one", "two", "three", "four", "five"]
arr4[1...2] = ["123", "456"]
println(arr4)		// [["one", "123", "456", "four", "five"]

// 还有一种用法，可以改变数组：
var arr5 = [1, 2, 3, 4, 5]	// [1, 2, 3, 4, 5]
arr5[2...arr5.count - 1] = [9, 0]
println(arr5)		// [1， 2， 9， 0]


// Swift也支持二位数组和多维数组
var arr6: [[Int]] = [[1, 2], [3, 4]]	// [[1, 2], [3, 4]]
println(arr6[0][1])		// 2

var arr7 = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
println(arr7[0][1][1])	// 4




// 创建和构造数组
var arr8 = [Int](count: 3, repeatedValue: 1)
println(arr8)	// [1, 1, 1]




