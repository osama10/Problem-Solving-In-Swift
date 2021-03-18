/// 70
import Foundation

func climbStairs(_ n: Int) -> Int {
    var memo = [Int:Int]()
    return numberOfWays(n, &memo)
}

func numberOfWays(_ n: Int, _ memo: inout [Int: Int]) ->Int{
    if n == 1 { return 1 }
     else if n == 2 { return 2 }
    else if memo[n] != nil {
        return memo[n]!
    }

    memo[n] = numberOfWays(n - 1, &memo) + numberOfWays( n - 2, &memo)
    return memo[n]!

}

func numberOfWaysBottomUp( _ n: Int) -> Int {
    if n < 3 { return n }
    var dp = Array(repeating: 0, count: n + 1)

    dp[1] = 1
    dp[2] = 2

    for i in 3..<dp.count { dp[i] = dp[i - 1] + dp[i - 2] }

    return dp[dp.count - 1]
}

climbStairs(8)
numberOfWaysBottomUp(8)

