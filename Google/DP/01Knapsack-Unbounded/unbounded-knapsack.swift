/*
 Given two integer arrays to represent weights and profits of ‘N’ items, we need to find a subset of these items which will give us maximum profit such that their cumulative weight is not more than a given number ‘C’. We can assume an infinite supply of item quantities; therefore, each item can be selected multiple times.
 */


func unboundedKnapsack(profits: [Int],
                       weights: [Int],
                       maxWeight: Int) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: maxWeight + 1), count: profits.count + 1)
    
    return calculateMaxProfit(profits, weights, maxWeight, profits.count, &memo)
}

func calculateMaxProfit(_ profits: [Int],
                        _ weights: [Int],
                        _ maxWeight: Int,
                        _ n: Int,
                        _ memo: inout [[Int]]) -> Int {
    
    if n == 0 || maxWeight <= 0 {
        return 0
    }
    
    if memo[n][maxWeight] == -1 {
        var profit1 = 0
        
        if weights[n - 1] <= maxWeight {
            profit1 = profits[n - 1] + calculateMaxProfit(profits, weights, maxWeight - weights[n - 1], n, &memo)
        }
        
        let profit2 = calculateMaxProfit(profits, weights, maxWeight , n - 1, &memo)
        
        memo[n][maxWeight] = max(profit1, profit2)
    }
    
    return memo[n][maxWeight]
}

unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], maxWeight: 8)// 140
unboundedKnapsack(profits: [15, 50, 60, 90], weights: [1, 3, 4, 5], maxWeight: 6) // 105
unboundedKnapsack(profits: [10, 30, 20], weights: [5, 10, 15], maxWeight: 100) // 300
unboundedKnapsack(profits: [1, 30], weights: [1, 50], maxWeight: 100) // 100
unboundedKnapsack(profits: [10, 40, 50, 70], weights: [1, 3, 4, 5], maxWeight: 8) // 110