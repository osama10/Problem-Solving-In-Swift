class Solution {
    var visited = [[Bool]]()
    func closedIsland(_ grid: [[Int]]) -> Int {
        guard grid.count > 2 && grid[0].count > 2 else { return 0 }
        var grid = grid 
        var count = 0
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if  grid[row][col] == 0 {
                    if dfs(&grid, row, col)  {
                        count += 1
                    }
                }
            }
        }
        
        return count
         
    }
    
    func dfs(_ grid: inout [[Int]], _ row: Int, _ col: Int) -> Bool {
        if row < 0 
        || row >= grid.count 
        || col < 0 
        || col >= grid[0].count
        { return false }
        
        
        if grid[row][col] == 1 {
            return true
        }
        
        grid[row][col] = 1
        
        let left = dfs(&grid, row - 1, col) 
        let right = dfs(&grid, row + 1, col) 
        let up = dfs(&grid, row, col + 1)  
        let down = dfs(&grid, row, col - 1) 
       
        return left && right && up && down
       
        
    }
}