/// https://www.educative.io/courses/grokking-dynamic-programming-patterns-for-coding-interviews/RM1BDv71V60
func solveKnapSack(_ costs: [Int], _ profits: [Int], _ maxCost: Int) -> Int {
    var dp = Array(repeating: Array(repeating: -1, count: maxCost + 1), count: profits.count)
    return knapSackRecursive(&dp, maxCost: maxCost, index: 0, cost: costs, profits: profits)
}


func knapSackRecursive( _ dp: inout [[Int]], maxCost: Int, index: Int, cost: [Int], profits: [Int]) -> Int {

    if index < 0 || index > profits.count - 1 { return 0 }

    if dp[index][maxCost] != -1 { return dp[index][maxCost] }

    var value1 = 0

    if cost[index] <= maxCost {
        value1 = profits[index] + knapSackRecursive(&dp, maxCost: maxCost - cost[index], index: index + 1, cost: cost, profits: profits)
    }

    let value2 = knapSackRecursive(&dp, maxCost: maxCost, index: index + 1, cost: cost, profits: profits)

    dp[index][maxCost] = max(value1, value2)
    return dp[index][maxCost]

}


solveKnapSack([1, 2, 3, 5], [1, 6, 10, 16], 7)
