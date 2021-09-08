/// 322 https://www.geeksforgeeks.org/find-minimum-number-of-coins-that-make-a-change/
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var cache = Array(repeating: -1, count: amount + 1)
    let result = coinChangeUtil(coins, amount, &cache)
    return result == Int.max ? -1 : result
}


func coinChangeUtil(_ coins: [Int], _ amount: Int, _ cache: inout [Int]) -> Int {
    if amount == 0 { return 0 }
    if cache[amount] != -1 { return cache[amount] }
    var min = Int.max

    for coin in coins {
        var subMin =  Int.max
        if coin <= amount {
            subMin = coinChangeUtil(coins, amount - coin, &cache)
            if subMin != Int.max && min > subMin + 1 { min = subMin + 1 }
        }

    }

    cache[amount] = min
    return cache[amount]
}