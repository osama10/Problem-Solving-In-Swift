class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var row = 0
        var coinsNeeded = 0
        
        while coinsNeeded <= n {
            row += 1
            coinsNeeded += row            
        }
        
        return row - 1
    }
}