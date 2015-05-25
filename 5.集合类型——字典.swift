// Playground - noun: a place where people can play

import UIKit

// 定义字典
// [key:value, key:value, ...]
var dic1: [String:Int] = ["yuwen":120, "shuxue":98]
var dic2 = Dictionary(dictionaryLiteral: ("yuwen", 120), ("shuxue", 98))


// 修改元素
dic1["yuwen"] = 114
dic1.updateValue(103, forKey: "shuxue")
println(dic1)	// [shuxue:103, yuwen:114]


// 获取所有键值
let keys = Array(dic2.keys)			// ["shuxue", "yuwen"]
let values = Array(dic2.values)		// [98, 120]


// 创建字典的几种方式
var dic3 = Dictionary<Int , String>()
var dic4 = [String:Int]()
var dic5: [String:Int] = Dictionary(minimumCapacity: 0)

// 向字典中添加元素
dic5["English"] = 93
dic5["Wuli"] = 78
println(dic5)	// [English:93]

// 删除元素
dic5["English"] = nil
println(dic5)	// [Wuli:78]
dic5.removeValueForKey("Wuli")
println(dic5)	// [:]















