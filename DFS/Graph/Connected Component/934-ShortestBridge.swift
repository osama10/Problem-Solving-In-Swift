class Solution {
    var queue = [[Int]]()
    let directions = [[1,0], [-1,0],[0,1],[0,-1]]
    
    func shortestBridge(_ grid: [[Int]]) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), 
                            count: grid.count)
        var grid = grid
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == 1 {
                    dfs(&grid, row, col)
                    break
                }
            }
            
            if !queue.isEmpty { break }
        }
        
        return bfs(&grid)
        
    }
    
    func bfs(_ grid: inout [[Int]]) -> Int {
        var bridges = -1
         var visited = Array(repeating: Array(repeating: false, count: grid[0].count), 
                            count: grid.count)
        queue.forEach { visited[$0[0]][$0[1]] = true }
        
        while !queue.isEmpty {
            let count = queue.count 
            
            for _ in 0..<count {
                let curr = queue.removeFirst()
                let (row, col) = (curr[0], curr[1])
                
                if grid[row][col] == 1 {
                    return bridges 
                }
                
                for dir in directions {
                    let nextRow = row + dir[0]
                    let nextCol = col + dir[1]
                    
                    if nextRow < 0
                    || nextRow >= grid.count
                    || nextCol < 0
                    || nextCol >= grid[0].count
                    || visited[nextRow][nextCol] { continue }
                    
                    visited[nextRow][nextCol] = true
                    queue.append([nextRow, nextCol])
                }
            }
            
            bridges += 1
        }
        
        return bridges 
    }
    
    func dfs(_ grid: inout [[Int]], _ row: Int, _ col: Int) {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count  {
            return
        }
        
        if grid[row][col] != 1 { return }
        
        grid[row][col] = 2
        queue.append([row, col, 0])
        
        for dir in directions {
            let (nextRow, nextCol) = (row + dir[0], col + dir[1])
            dfs(&grid, nextRow, nextCol)
        }
    }
}