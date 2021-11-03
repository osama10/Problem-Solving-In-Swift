/*
 Given an integer n, return true if and only if it is an Armstrong number.

 The k-digit number n is an Armstrong number if and only if the kth power of each digit sums to n.

 Example 1:

 Input: n = 153
 Output: true
 Explanation: 153 is a 3-digit number, and 153 = 13 + 53 + 33.
 Example 2:

 Input: n = 123
 Output: false
 Explanation: 123 is a 3-digit number, and 123 != 13 + 23 + 33 = 36.
 */

func isArmstrong(_ n: Int) -> Bool {
    let numberArray = numberToArray(n)
    let powerSum = numberArray.reduce(into: 0, { partialResult, digit in
        partialResult += pow(Double(digit), Double(numberArray.count))
    })
    return Int(powerSum) == n
}


func numberToArray(_ n: Int) -> [Int] {
    if n == 0 { return [0] }
    var n = n
    var result = [Int]()
    
    while n != 0 {
        let digit = n % 10
        n = n / 10
        result.append(digit)
    }
    
    return result
}

isArmstrong(123)