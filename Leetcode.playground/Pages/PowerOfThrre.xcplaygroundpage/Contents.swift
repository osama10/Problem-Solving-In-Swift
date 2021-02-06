//: [Previous](@previous)

import Foundation

// 326


func isPowerOfThree(_ n: Int) -> Bool {
    if n == 1 { return true }
    if n < 3 { return false }

    var value = n
    while value != 3 {
        if value % 3 != 0 { return false }
        value = value / 3
    }

    return true
}

isPowerOfThree(45)
isPowerOfThree(27)
isPowerOfThree(1)
isPowerOfThree(2)

print(1%3)
