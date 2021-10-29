class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        
        for row in 1..<matrix.count {
            for col in 0..<matrix[row].count {
                
                let val1 = dp[row - 1][col]// case 1
                let val2 = (col - 1 >= 0) ? dp[row - 1][col - 1] : Int.max //case 2
                let val3 = (col + 1 < matrix[0].count) ? dp[row - 1][col + 1] : Int.max // case 3
               
                dp[row][col] = min(val1, val2, val3) + matrix[row][col]
            }
        }
        
        return dp.last?.min() ?? 0
    }
}