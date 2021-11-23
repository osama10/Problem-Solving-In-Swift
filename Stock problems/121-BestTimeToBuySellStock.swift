class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var leastTillNow = Int.max
        var maxProf = 0
        
        for price in prices {
            leastTillNow = min(leastTillNow, price)
            maxProf = max(maxProf, price - leastTillNow)
        }
        
        return maxProf
    }
}