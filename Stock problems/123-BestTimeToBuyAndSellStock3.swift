class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var leftMinBuy = prices[0]
        var rightMax = prices.last!
        
        var left = Array(repeating: 0, count: prices.count)
        var right = Array(repeating: 0, count: prices.count + 1)
        
        for leftIndex in 1..<prices.count {
            left[leftIndex] = max(left[leftIndex - 1], prices[leftIndex] - leftMinBuy)
            leftMinBuy = min(leftMinBuy, prices[leftIndex])
            
            let rightIndex = prices.count - 1 - leftIndex
            right[rightIndex] = max(right[rightIndex + 1], rightMax - prices[rightIndex])
            rightMax = max(rightMax, prices[rightIndex])
        }
        
        var maxProfit = Int.min 
        
        for i in 0..<prices.count {
            maxProfit = max(maxProfit, left[i] + right[i + 1])
        }
        
        return maxProfit

    }
}