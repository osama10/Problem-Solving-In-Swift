class Solution {
    var memo = [Int: Int]()
    
    func numWays(_ n: Int, _ k: Int) -> Int {
         calWays(n, k)
    }
    
    func calWays(_ n: Int, _ colors: Int) -> Int {
        
        if n == 1 {
            return colors
        }
        
        if n == 2 {
            return colors * colors
        }
        
        
        if let totalWays = memo[n] {
            return totalWays
        }
        
        memo[n] = (colors - 1) * (calWays(n - 1, colors) +  calWays(n - 2, colors) )
        
        return memo[n]!
    }
}