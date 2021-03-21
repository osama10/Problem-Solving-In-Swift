/// https://www.geeksforgeeks.org/min-cost-path-dp-6/
func minCostPathTD(_ cost: [[Int]], _ m: Int, _ n: Int) -> Int {
    var cache = Array(repeating: Array(repeating: -1, count: m+1 ), count: n + 1)
    return calMinCostPathTD(cost, m, n, &cache)
}

func calMinCostPathTD(_ cost: [[Int]], _ m: Int, _ n: Int, _ cache: inout [[Int]]) -> Int {
    if m < 0 || n < 0 { return Int.max }
    if m == 0 && n == 0 { return cost[0][0] }
    if cache[m][n] != -1 { return cache[m][n] }

    return cost[m][n] + min(calMinCostPathTD(cost, m-1, n-1, &cache),
                            min(calMinCostPathTD(cost, m-1, n, &cache),
                                calMinCostPathTD(cost, m, n-1, &cache)))

}

minCostPathTD([ [1, 2, 3],
              [4, 8, 2],
              [1, 5, 3] ], 2, 2)



func minCostPathBU(_ cost: [[Int]], _ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: -1, count: cost[0].count ), count: cost.count)
    dp[0][0] = cost[0][0]

    for i in 1..<m + 1 { dp[i][0] = dp[i - 1][0] + cost[i][0] }
    for i in 1..<n + 1 { dp[0][i] = dp[0][i - 1] + cost[0][i] }

    for row in 1..<m+1 {
        for col in 1..<n+1 {
            dp[row][col] = cost[row][col] + min(dp[row - 1][col], min(dp[row][col-1], dp[row-1][col-1]))
        }
    }

    return dp[m][n]
}

minCostPathBU([ [1, 2, 3],
                [4, 8, 2],
                [1, 5, 3] ], 2, 2)
