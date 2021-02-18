import Foundation


/// https://algorithms.tutorialhorizon.com/number-of-islands/


func dfs(row: Int, col: Int, grid: inout [[String]], rows: Int, cols: Int) {

    if row < 0 || col < 0 || row >= rows || col >= cols || grid[row][col] != "1" { return }

    grid[row][col] = "0"

    dfs(row: row + 1, col: col, grid: &grid, rows: rows, cols: cols)
    dfs(row: row - 1, col: col, grid: &grid, rows: rows, cols: cols)
    dfs(row: row, col: col + 1, grid: &grid, rows: rows, cols: cols)
    dfs(row: row, col: col - 1, grid: &grid, rows: rows, cols: cols)
}

func numberOfIslands(_ grid: inout [[String]]) -> Int {

    if grid.isEmpty { return 0 }

    var totalIslands = 0
    let rows = grid.count
    let cols = grid[0].count

    for row in 0..<rows {
        for col in 0..<cols {
            if grid[row][col] == "1" {
                dfs(row: row, col: col, grid: &grid, rows: rows, cols: cols)
                totalIslands += 1
            }
        }
    }
    return totalIslands
}


var grid1 = [
                ["1", "1", "1", "1", "0"],
               ["1", "1", "0", "1", "0"],
                ["1", "1", "0", "1", "0"],
                ["1", "1", "0", "0", "0"],
               ["0", "0", "0", "0", "0"]
    ]

numberOfIslands(&grid1) /// 1


var grid2 = [
                ["1", "1", "0", "0", "0"],
               ["1", "1", "0", "0", "0"],
                ["0", "0", "1", "0", "0"],
                ["0", "0", "0", "1", "1"]
    ]

numberOfIslands(&grid2) /// 3
