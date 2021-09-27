func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    var queue = [(row: Int, col: Int)]()
    var distance = Array(repeating: Array(repeating: Int.max, count: mat[0].count), count: mat.count)
    let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    
    for row in 0..<mat.count {
        for col in 0..<mat[0].count {
            if mat[row][col] == 0 {
                distance[row][col] = 0
                queue.append((row, col))
            }
        }
    }
    
    while !queue.isEmpty {
        let (row, col) = queue.removeFirst()
        for direction in directions {
            let nextRow = row + direction[0]
            let nextCol = col + direction[1]
            
            if nextRow < 0 || nextCol < 0 || nextRow >= mat.count || nextCol >= mat[0].count || mat[nextRow][nextCol] == 0 {
                continue
            }
            
            if distance[nextRow][nextCol] > distance[row][col] + 1 {
                distance[nextRow][nextCol] = distance[row][col] + 1
                queue.append((nextRow, nextCol))
            }
        }
    }
    
    return distance
}
