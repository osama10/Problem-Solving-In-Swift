func numDistinctIslands(_ grid: [[Int]]) -> Int {
    var distinctIslands = Set<[[Int]]>()
    var grid = grid
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == 1 {
                var shape = [[Int]]()
                findDistinctIsland(&grid, row, col, row, col, &shape)
                distinctIslands.insert(shape)
            }
        }
    }
    
    return distinctIslands.count
}

func findDistinctIsland(_ grid: inout[[Int]], _ orginRow: Int, _ originCol: Int, _ row: Int, _ col: Int , _ shape: inout[[Int]]) {
    
    if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count || grid[row][col] == 0 { return
        
    }
    
    shape.append([row - orginRow, col - originCol])
    
    grid[row][col] = 0
    
    findDistinctIsland(&grid, orginRow, originCol, row + 1, col, &shape)
    findDistinctIsland(&grid, orginRow, originCol, row - 1, col, &shape)
    findDistinctIsland(&grid, orginRow, originCol, row, col + 1, &shape)
    findDistinctIsland(&grid, orginRow, originCol, row, col - 1, &shape)

}