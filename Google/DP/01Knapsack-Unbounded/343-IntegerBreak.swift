/*
 Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.

 Return the maximum product you can get.
 
 Example 1:

 Input: n = 2
 Output: 1
 Explanation: 2 = 1 + 1, 1 × 1 = 1.
 
 Example 2:

 Input: n = 10
 Output: 36
 Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
 
 
 
 3 + 1 = 3
 2 + 2 = 4
 1 + 3 = 3
 */

func integerBreak(_ n: Int) -> Int {
    var dp = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    
    for i in 1...n {
        for j in 1..<i {
            let a = (i - j) * j
            let b = dp[(i - j)] * j
            dp[i] = max(dp[i], a, b)
        }
    }
    
    return dp[n]
}


integerBreak(10) // 36
