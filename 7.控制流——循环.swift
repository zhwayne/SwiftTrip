// Playground - noun: a place where people can play

import UIKit

/*******************************
 *	For - in
 ******************************/

for index in 1...5{
	print(index)
}// 依次输出 1， 2， 3， 4， 5

// ... 表示闭区间, ..<表示不包括最后一个元素

for index in 1..<5{
    print(index)
}// 依次输出1， 2， 3， 4

// 如果不关心索引值，可用 _ 代替
var n1 = 2, n2 = 3, sum1 = 0
for _ in 1...5{
	sum1 += n1 * n2
}//



/*******************************
*	For
******************************/
for var i = 0; i < 5; ++i{
    print(i)
}// 0, 1, 2, 3, 4
// 自增操作中，swift不允许写作i++




/*******************************
*	While
******************************/
var i = 0
while i++ < 5{
    println(i)
}// 1，2，3，4，5



/*******************************
*	Do - While
******************************/
var j = 0
do{
    println(j)
}while j++ < 5
// 0， 1， 2， 3，4，5



// 其他
loop1: for var i = 0; i < 5; ++i{
    loop2: for var j = 0; j < 5; ++j{
        if i == 3 && j == 3{
            println("jump")
            break loop1
        }
    }
}


















