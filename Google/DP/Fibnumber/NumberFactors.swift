/*
Given a number ‘n’, implement a method to count how many possible ways there are to express ‘n’ as the sum of 1, 3, or 4.
*/
func countWays(_ n: Int) -> Int {
    var dp = Array(repeating: 0, count: n + 1)
    if n == 0 { return 0 }
    if n < 3 { return 1 }
    
    dp[0] = 1
    dp[1] = 1
    dp[2] = 1
    dp[3] = 2
    
    for num in 4...n {
        dp[num] = dp[num - 1] + dp[num - 3] + dp[num - 4]
    }
    
    return dp[n]
}

countWays(4)
countWays(5)
countWays(6)
