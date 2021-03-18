/// 200

func numIslands(_ grid: [[Int]]) -> Int {
    if grid.isEmpty { return 0 }

    var grid = grid
    var numberIslands = 0

    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == 1 {
                dfs(&grid, row: row, col: col)
                numberIslands += 1
            }
        }
    }

    return numberIslands
}


func dfs(_ grid: inout [[Int]], row: Int, col: Int) {
    if row < 0 || col < 0 || row >= grid.count || col >= grid[0].count || grid[row][col] != 1 { return }

    grid[row][col] = 0

    dfs(&grid, row: row - 1, col: col)
    dfs(&grid, row: row + 1, col: col)
    dfs(&grid, row: row , col: col - 1)
    dfs(&grid, row: row , col: col + 1)
}