func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
  
    guard heights.count > 0 && heights[0].count > 0 else { return [] }
  
    var pacificQueue = [(row: Int, col: Int)]()
    var atlancticQueue = [(row: Int, col: Int)]()
    
    let totalRows = heights.count
    let totalCol = heights[0].count
    
    for i in 0..<totalRows {
        pacificQueue.append((i, 0))
        atlancticQueue.append((i, totalCol - 1))
    }
    
    for i in 0..<totalCol {
        pacificQueue.append((0, i))
        atlancticQueue.append((totalRows - 1, i))
    }
    
    let reachableToPacific = bfs(&pacificQueue, totalRows, totalCol, heights)
    let reachableToAtlantic = bfs(&atlancticQueue, totalRows, totalCol, heights)
    
    var result = [[Int]]()
    
    for i in 0..<totalRows {
        for j in 0..<totalCol {
            if reachableToPacific[i][j]
                && reachableToAtlantic[i][j] {
                result.append([i, j])
            }
        }
    }

    return result
}


func bfs(_ queue: inout [(row: Int, col: Int)], _ totalRow: Int, _ totalCol: Int, _ heights: [[Int]]) -> [[Bool]] {
    var reachableArea = Array(repeating: Array(repeating: false, count: totalCol), count: totalRow)
    
    let directions = [(0, 1), (1, 0), (-1, 0), (0, -1)]
    
    while !queue.isEmpty {
        let (row, col) = queue.removeFirst()
        
        reachableArea[row][col] = true

        for nextDir in directions {
            let nextRow = row + nextDir.0
            let nextCol = col + nextDir.1
            
            if nextRow < 0 || nextRow >= totalRow
                || nextCol < 0 || nextCol >= totalCol
                || reachableArea[nextRow][nextCol]
                || heights[nextRow][nextCol] < heights[row][col] {
                continue
            }
            
            queue.append((nextRow, nextCol))
        }
    }
    
    return reachableArea
}