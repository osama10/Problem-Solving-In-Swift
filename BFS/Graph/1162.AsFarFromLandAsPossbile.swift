class Solution { 
    func maxDistance(_ grid: [[Int]]) -> Int {
        let water = 0
        let land = 1
        var queue = [(row: Int, col: Int)]()
        let directions: [(row: Int, col: Int)] = [(0,1), (0, -1), (1,0), (-1,0)]
        var level = 0
        
        var visited = Array(repeating: Array(repeating:false, count: grid[0].count ), count: grid.count)
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == land {
                    queue.append((row, col))
                    visited[row][col] = true
                }
            }
        }
        
        if queue.isEmpty || queue.count == (grid[0].count * grid.count) {
            return -1
        }
        
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let (row, col) = queue.removeFirst()
                for dir in directions {
                    
                    let (nextRow, nextCol) = (row + dir.row, col + dir.col)
                    
                    if nextRow < 0 
                    || nextRow >= grid.count
                    || nextCol < 0
                    || nextCol >= grid[0].count
                    || visited[nextRow][nextCol] { continue }
                    
                    queue.append((nextRow, nextCol))
                    visited[nextRow][nextCol] = true
                }
            }
            
            level += 1
        }
        
        return level - 1
    }
}