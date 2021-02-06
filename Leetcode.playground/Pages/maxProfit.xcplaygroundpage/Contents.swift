import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = 0
    var minBuy = prices.first!

    for price in prices[1...] {
        minBuy = min(minBuy, price)
        maxProfit = max(maxProfit, price - minBuy)
    }

    return maxProfit
}

maxProfit([7,1,5,3,6,4])

