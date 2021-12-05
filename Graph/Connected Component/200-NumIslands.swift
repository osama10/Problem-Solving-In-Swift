func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    var totalIslands = 0
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == "1" {
                findNumberOfIslands(&grid, row, col)
                totalIslands += 1
            }
        }
    }
    
    return totalIslands
}

func findNumberOfIslands(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
    
    if row < 0 || row > grid.count - 1 || col < 0 || col > grid[0].count - 1 || grid[row][col] == "0" {
        return
    }
    
    grid[row][col] = "0"
    
    findNumberOfIslands(&grid, row - 1, col)
    findNumberOfIslands(&grid, row + 1, col)
    findNumberOfIslands(&grid, row, col - 1)
    findNumberOfIslands(&grid, row, col + 1)

}
