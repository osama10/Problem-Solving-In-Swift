/// 518 https://www.geeksforgeeks.org/coin-change-dp-7/
func change(_ amount: Int, _ coins: [Int]) -> Int  {
    var cache = Array(repeating: Array(repeating: -1, count: coins.count + 1), count: amount + 1)
    return coinChangeUtil(coins, amount, coins.count, &cache)
}


func coinChangeUtil(_ coin: [Int], _ amount: Int, _ index: Int, _ cache: inout [[Int]]) -> Int {

    if amount == 0 { return 1 }

    if amount < 0 { return 0 }

    if index <= 0 && amount > 0 { return 0 }

    if cache[amount][index] != -1 { return cache[amount][index] }

    cache[amount][index] = coinChangeUtil(coin, amount, index - 1, &cache) + coinChangeUtil(coin, amount - coin[index - 1], index, &cache)

    return cache[amount][index]
}

change(10, [10])