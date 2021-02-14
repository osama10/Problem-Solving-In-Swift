import Foundation

/// 959

func regionsBySlashes(_ grid: [String]) -> Int {
    if grid.count == 0 { return 0 }

    var totalRegions = 0
    let charMapper: [Character : [[Int]]] = [ "/" : [[0,0,1], [0,1,0], [1,0,0]],
                       "\\" :[[1,0,0], [0,1,0], [0,0,1]],
                       " " :[[0,0,0], [0,0,0], [0,0,0]]
    ]
    var matrix = [[Int]]()

    for row in grid {
        var row1 = [Int](), row2 = [Int](), row3 = [Int]()
        for char in row {
            let charMapping = charMapper[char]!
            row1 += charMapping[0]
            row2 += charMapping[1]
            row3 += charMapping[2]
        }
        matrix += [row1, row2, row3]
    }

    for row in 0..<matrix.count {
        for col in 0..<matrix[row].count {
            if matrix[row][col] == 0 {
                dfs(graph: &matrix, row: row, col: col, rows: matrix.count, cols: matrix[row].count)
                totalRegions += 1
            }
        }
    }

    return totalRegions

}

func dfs(graph: inout[[Int]], row: Int, col: Int, rows:Int, cols: Int) {

    if row < 0 || col < 0 || row >= rows || col >= cols || graph[row][col] != 0 { return }
    graph[row][col] = -1

    dfs(graph: &graph, row: row - 1, col: col, rows: rows, cols: cols)
    dfs(graph: &graph, row: row + 1, col: col, rows: rows, cols: cols)
    dfs(graph: &graph, row: row, col: col - 1, rows: rows, cols: cols)
    dfs(graph: &graph, row: row, col: col + 1, rows: rows, cols: cols)

}
