class Solution {
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let directions = [[0, 1], [0, -1], [1, 0], [-1, 0],[-1, -1], [1, -1], [-1, 1], [1, 1]]
        
        if grid[0][0] == 1 { return -1 }
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var queue = [(row: 0, col: 0)]
        visited[0][0] = true
        var path = 1
        
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let pos = queue.removeFirst()
                
                if pos.row == grid.count - 1 && pos.col == grid[0].count - 1 {
                    return path
                }
                
                for dir in directions {
                    let (nextRow, nextCol) = (pos.row + dir[0], pos.col + dir[1])
                    
                    if nextRow < 0
                        || nextRow >= grid.count
                        || nextCol < 0
                        || nextCol >= grid[0].count
                        || grid[nextRow][nextCol] == 1
                        || visited[nextRow][nextCol] {
                        continue
                    }
                    
                    queue.append((nextRow, nextCol))
                    visited[nextRow][nextCol] = true
                }
            }
            
            path += 1
        }
        
        return -1
    }
}
