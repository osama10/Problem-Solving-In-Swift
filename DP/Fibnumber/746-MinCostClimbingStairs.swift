func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = Array(repeating: -1, count: cost.count + 1)
    dp[0] = 0
    dp[1] = 0
    
    for stair in 2...cost.count {
        let cost1 = dp[stair - 1] + cost[stair - 1]
        let cost2 = dp[stair - 2] + cost[stair - 2]

        dp[stair] = min(cost1, cost2)
    }
    
    return dp[cost.count]
}

// recursive
func calCostClimbingStairs(_ cost: [Int], _ currentStair: Int, _ memo: inout [Int]) -> Int {
    if currentStair <= 1 {
        return 0
    }
    
    if memo[currentStair] == -1 {
        let costWithClimbinOneStair = calCostClimbingStairs(cost, currentStair - 1, &memo) + cost[currentStair - 1]
        let costWithClimbinTwoStair = calCostClimbingStairs(cost, currentStair - 2, &memo) + cost[currentStair - 2]
       
        memo[currentStair] = min(costWithClimbinOneStair, costWithClimbinTwoStair)
    }
    
    return memo[currentStair]
}

minCostClimbingStairs([10, 15, 20])
