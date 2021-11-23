class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        
        for i in 1..<prices.count {
            if prices[i - 1] < prices[i] {
                profit += prices[i] - prices[i - 1]
            }
        }
        
        return profit
    }
}