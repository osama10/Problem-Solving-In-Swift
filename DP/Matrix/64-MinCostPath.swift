class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = Array(repeating: 
                       Array(repeating: 0, count: grid[0].count), 
                       count : grid.count)
       
        dp[0][0] = grid[0][0]
        
        for row in 1..<grid.count {
            dp[row][0] += dp[row - 1][0] + grid[row][0]
        }
        
        for col in 1..<grid[0].count {
            dp[0][col] = dp[0][col - 1] + grid[0][col]
        }
        
        for row in 1..<grid.count {
            for col in 1..<grid[0].count {
                dp[row][col] = grid[row][col] + min(dp[row - 1][col], dp[row][col-1])
            }
        }
        
        return dp[grid.count-1][grid[0].count - 1]
    }
    
    
}