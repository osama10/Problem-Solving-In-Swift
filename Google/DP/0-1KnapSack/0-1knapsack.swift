/// https://www.educative.io/courses/grokking-dynamic-programming-patterns-for-coding-interviews/RM1BDv71V60
func knapsack(_ wt:[Int], _ val: [Int], _ totalWt: Int) -> Int{
    var cache = Array(repeating: Array(repeating: -1, count: totalWt + 1), count: wt.count + 1)
    return knapsackRecursive(wt,  val, totalWt, &cache, index: 0)
}

func knapsackRecursive(_ wt:[Int], _ val: [Int], _ totalWt: Int, _ cache: inout [[Int]], index: Int) -> Int {
    if totalWt <= 0 || index > wt.count - 1 { return 0 }
    if cache[index][totalWt] != -1 { return cache[index][totalWt] }
    var profit1 = 0
    if totalWt >= wt[index] { profit1 = val[index] + knapsackRecursive(wt, val, totalWt - wt[index], &cache, index: index + 1) }
    let profit2 = knapsackRecursive(wt, val, totalWt, &cache, index: index + 1)
    cache[index][totalWt] = max(profit1, profit2)
    return cache[index][totalWt]
}

knapsack([1, 2, 3, 5], [1, 6, 10, 16], 7)
