/// 518 https://www.geeksforgeeks.org/coin-change-dp-7/
func change(_ amount: Int, _ coins: [Int]) -> Int  {
    var cache = Array(repeating: Array(repeating: -1, count: coins.count + 1), count: amount + 1)
    return coinChangeUtil(coins, amount, coins.count, &cache)
}


func coinChangeUtil(_ coin: [Int], _ amount: Int, _ coinCount: Int, _ cache: inout [[Int]]) -> Int {

    if amount == 0 { return 1 }

    if amount < 0 { return 0 }

    if coinCount <= 0 && amount > 0 { return 0 }

    if cache[amount][coinCount] != -1 { return cache[amount][coinCount] }

    let x = coinChangeUtil(coin, amount, coinCount - 1, &cache)

    let y = coinChangeUtil(coin, amount - coin[coinCount - 1], coinCount, &cache)

    cache[amount][coinCount] = x + y

    return cache[amount][coinCount]
}

change([10], 10)