class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    
        var memo = Array(repeating: Array(repeating: -1, count: obstacleGrid[0].count),
                     count: obstacleGrid.count)
        
        return calUniquePaths(obstacleGrid, obstacleGrid.count - 1, obstacleGrid[0].count - 1, &memo)
    }
    
func calUniquePaths(_ grid: [[Int]], _ row: Int, _ col : Int, _ memo: inout [[Int]]) -> Int {

    if row == 0 && col == 0 {
        return grid[row][col] == 0 ? 1 : 0
    }
    
    if row < 0 || col < 0 { return 0 }
    
    if grid[row][col] == 1 {
        return 0
    }
    
    if memo[row][col] == -1 {
        memo[row][col] = calUniquePaths(grid,row, col - 1, &memo) + calUniquePaths(grid,row - 1, col, &memo)
    }
    
    return memo[row][col]
}
}