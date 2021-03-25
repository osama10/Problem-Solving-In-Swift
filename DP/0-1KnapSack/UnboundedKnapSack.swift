// https://www.geeksforgeeks.org/unbounded-knapsack-repetition-items-allowed/

func unboundedKnapsack(_ wt:[Int], _ val: [Int], _ totalWt: Int) -> Int {
    var cache = Array(repeating: -1, count: totalWt + 1)
    return maxProfit(wt, val, totalWt, &cache)
}


func maxProfit(_ wt: [Int], _ val: [Int], _ totalWt: Int, _ cache: inout [Int]) -> Int {
    if totalWt <= 0 { return 0 }

    if cache[totalWt] != -1 { return cache[totalWt] }

    var maxVal = 0

    for i in 0..<wt.count {
        if wt[i] <= totalWt {
            let partialMax = maxProfit(wt, val, totalWt - wt[i], &cache) + val[i]
            maxVal = max(maxVal, partialMax)
        }
    }

    cache[totalWt] = maxVal
    return cache[totalWt]
}

unboundedKnapsack([5, 10, 15], [10, 30, 20], 100) // 300
unboundedKnapsack([1, 50], [1, 30], 100) // 100
unboundedKnapsack([1, 3, 4, 5], [10, 40, 50, 70], 8) // 110