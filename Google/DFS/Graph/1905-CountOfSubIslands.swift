class Solution {
    var islands = [[(row: Int, col: Int)]]()
    
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        var grid2 = grid2
        
        for row in 0..<grid2.count {
            for col in 0..<grid2[0].count {
                if grid2[row][col] == 1 {
                    var island = [(row: Int, col: Int)]()
                    dfs(&grid2, row, col, &island)
                    islands.append(island)
                }
            }
        }
        
        var subIslands = 0
        
        for island in islands {
            var isSubIsland = true
            
            for area in island {
                if !isIsland(grid1, area.row, area.col) {
                    isSubIsland = false
                    break
                }
            }
            
            if isSubIsland {
                subIslands += 1
            }
        }

        return subIslands
        
    }
    
    func isIsland(_ grid: [[Int]], _ row: Int, _ col: Int) -> Bool {
         if row < 0 
        || row >= grid.count 
        || col < 0 
        || col >= grid[0].count 
        || grid[row][col] == 0 { return false }
        
        return true
    }
    
    func dfs(_ grid: inout [[Int]],
             _ row: Int,
             _ col: Int,
             _ island: inout[(row: Int, col: Int)]) {
        if row < 0 
        || row >= grid.count 
        || col < 0 
        || col >= grid[0].count 
        || grid[row][col] == 0 { return }
        
        grid[row][col] = 0
        island.append((row, col))
        
        dfs(&grid, row + 1, col, &island)
        dfs(&grid, row - 1, col, &island)
        dfs(&grid, row, col + 1, &island)
        dfs(&grid, row, col - 1, &island)
    }
}