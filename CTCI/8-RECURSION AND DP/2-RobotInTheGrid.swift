
/// 8.2 Robot in a Grid: Imagine a robot sitting on the upper left corner of grid with r rows and c columns. The robot can only move in two directions, right and down, but certain cells are "off limits" such that the robot cannot step on them. Design an algorithm to find a path for the robot from the top left to the bottom right.


func findPath(_ matrix: [[Int?]] ) -> [(x: Int, y: Int)] {
    var visited : [[Bool]] = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
    var path = [(x: Int, y: Int)]()
    if findPath(matrix, &visited, matrix.count - 1, matrix[0].count -  1, &path) {
        return path
    }
    return []
}


func findPath(_ matrix: [[Int?]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ path: inout [(x: Int, y: Int)]) -> Bool {
    
    if row < 0 || col < 0 || row >= matrix.count || col >= matrix[0].count || matrix[row][col] == nil { return false }
    
    if visited[row][col] { return false }
   
    if row == 0 && col == 0  {
        path.append((0,0))
        return true
    }
    
    if findPath(matrix, &visited, row - 1, col, &path) || findPath(matrix, &visited, row, col - 1, &path) {
        path.append((row,col))
        return true
    }
    
    visited[row][col] = true
    return false
}

var matrix1 = [[1, 1, 1], [1, 1, 1], [1, 1, 1] ]
var matrix2 = [[1, 1, 1], [1, 1, nil], [1, 1, 1] ]
var matrix3 = [[1, nil, 1], [1, 1, nil], [1, 1, 1] ]
var matrix4 = [[nil, nil, 1], [1, 1, nil], [1, 1, 1] ]

findPath(matrix1)
findPath(matrix2)
findPath(matrix3)
findPath(matrix4)
