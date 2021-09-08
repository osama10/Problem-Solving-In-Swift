/// 322 https://www.geeksforgeeks.org/find-minimum-number-of-coins-that-make-a-change/

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: amount + 1), count: coins.count + 1)
    let totalWays = calculateMinWays(coins, amount, coins.count, &memo)
    return totalWays == Int.max ? -1 : totalWays
}

func calculateMinWays(_ coins: [Int], _ amount: Int, _ n: Int, _ memo: inout [[Int]]) -> Int {
   
    if amount == 0 {
        return 0
    }
    
    if n == 0 {
        return Int.max
    }
    
    if memo[n][amount] == -1 {
        var waysWithN = Int.max
        if coins[n - 1] <= amount {
            let res = calculateMinWays(coins, amount - coins[n - 1], n, &memo)
            if res != Int.max {
                waysWithN = res + 1
            }
        }
        
        let waysWithoutN = calculateMinWays(coins, amount, n - 1, &memo)
        memo[n][amount] = min(waysWithN, waysWithoutN)
    }
    
    return memo[n][amount]
}

coinChange([1, 2, 3], 5)
coinChange([1, 2, 3], 11)
coinChange([1, 2, 3], 7)
coinChange([3, 5], 7)
coinChange([2,5,10,1], 27)

