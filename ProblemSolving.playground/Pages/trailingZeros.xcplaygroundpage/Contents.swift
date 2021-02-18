/// 172  https://www.geeksforgeeks.org/count-trailing-zeroes-factorial-number/
import Foundation

func trailingZeroes(_ n: Int) -> Int {
    if n < 5 { return 0 }
    var count = 0
    var n = n

    while n >= 5 {
        n = n / 5
        count += n
    }

    return count
}


trailingZeroes(25)
