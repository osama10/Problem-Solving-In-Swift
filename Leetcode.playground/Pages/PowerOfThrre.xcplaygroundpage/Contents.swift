//: [Previous](@previous)

import Foundation

// 326


func isPowerOfThree( _ x: Int) -> Bool {
    var val = x
    while val%3 == 0 { val /= 3 }
    return val == 1
}

isPowerOfThree(45)
isPowerOfThree(27)
isPowerOfThree(1)
isPowerOfThree(2)
isPowerOfThree(0)



























