class Solution {
   func minCost(_ grid: [[Int]]) -> Int {
    var queue = [(0, 0, 0)]
    var visited = Set<String>()
    
    let directions = [[], [0, 1], [0, -1], [1, 0],[-1, 0]]
    
    while !queue.isEmpty {
            let (row, col, cost) = queue.removeFirst()
            let origDirection = grid[row][col]
            visited.insert("\(row)-\(col)")
        
            if row == grid.count - 1 && col == grid[0].count - 1 {
                return cost
            }
            
            for (i) in 1...4 {
                let nextRow = row + directions[i][0]
                let nextCol = col + directions[i][1]
                
                if nextRow < 0
                    || nextRow >= grid.count
                    || nextCol < 0
                    || nextCol >= grid[0].count
                    || visited.contains("\(nextRow)-\(nextCol)") {
                    continue
                }
                
                if i == origDirection {
                    queue.insert((nextRow, nextCol, cost), at: 0)
                } else {
                    queue.append((nextRow, nextCol, cost + 1))
                }
                
            
        }
    }
    
    return -1
}

}