// 695

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var maxArea = Int.min
    var grid = grid

    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == 1 {
                var area = 0
                findMaxAreaOfIsland(&grid, &area, row, col)
                maxArea = max(maxArea, area)
            }
        }
    }

    return maxArea == Int.min ? 0 : maxArea
}


func findMaxAreaOfIsland(_ grid: inout [[Int]], _ area: inout Int, _ row: Int, _ col: Int) {
    if row < 0 || col < 0 || row >= grid.count || col >= grid[0].count || grid[row][col] != 1 { return }
    grid[row][col] = -1
    area += 1
    findMaxAreaOfIsland(&grid, &area, row + 1, col)
    findMaxAreaOfIsland(&grid, &area, row - 1, col)
    findMaxAreaOfIsland(&grid, &area, row , col + 1)
    findMaxAreaOfIsland(&grid, &area, row , col - 1)
}

var grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,1,1,0,1,0,0,0,0,0,0,0,0],
            [0,1,0,0,1,1,0,0,1,0,1,0,0],
            [0,1,0,0,1,1,0,0,1,1,1,0,0],
            [0,0,0,0,0,0,0,0,0,0,1,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,0,0,0,0,0,0,1,1,0,0,0,0]]

maxAreaOfIsland(grid)
