class Solution {
    var count = 0
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var grid = grid
        var startRow = -1
        var startCol = -1
        var nonObstaclePath = 0
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                
                if grid[row][col] >= 0 {
                    nonObstaclePath += 1
                }
                
                if grid[row][col] == 1 {
                    startRow = row
                    startCol = col
                    
                }
            }
            

        }
        
        dfs(&grid, startRow, startCol, nonObstaclePath)
        
        return count
    }
    
    func dfs(_ grid: inout [[Int]], _ row: Int, _ col: Int, _ remainingCell: Int) {
       
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count {
            return
        }
        
        if grid[row][col] == -1 {
            return 
        }
        
        if grid[row][col] == 2 && remainingCell == 1 {
            count += 1
            return
        }
        
        let temp = grid[row][col]
        grid[row][col] = -1
        
        dfs(&grid, row + 1, col, remainingCell - 1)
        dfs(&grid, row - 1, col, remainingCell - 1)
        dfs(&grid, row, col + 1, remainingCell - 1)
        dfs(&grid, row, col - 1, remainingCell - 1)
        
        grid[row][col] = temp
    }
}