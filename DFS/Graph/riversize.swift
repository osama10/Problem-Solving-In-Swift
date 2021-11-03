 // https://www.algoexpert.io/questions/River%20Sizes
 func riverSizes(_ matrix: [[Int]]) -> [Int] {
    var matrix = matrix
    var result = [Int]()
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if matrix[row][col] == 1 {
                var riverSize = 0
                dfs(&matrix, row, col, &riverSize)
                result.append(riverSize)
            }
        }
    }
    return result
 }

func dfs( _ matrix: inout [[Int]], _ row: Int, _ col: Int, _ riverSize: inout Int) {
    if row < 0 || col < 0 || row >= matrix.count || col >= matrix[0].count || matrix[row][col] != 1 { return }
    riverSize += 1
    matrix[row][col] = -1
    dfs(&matrix, row - 1, col, &riverSize)
    dfs(&matrix, row + 1, col, &riverSize)
    dfs(&matrix, row , col - 1, &riverSize)
    dfs(&matrix, row , col + 1, &riverSize)
}
