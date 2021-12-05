class Solution {
    func shortestDistance(_ grid: [[Int]]) -> Int {
        let (land, building) = (0, 1)
        var minDistance = Int.max
        var totalBuilding = 0
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == building {
                    totalBuilding += 1
                }
            }
        }
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == land {
                    minDistance = min(minDistance,bfs(grid, row, col, totalBuilding))
                }
            }
        }
        
        return minDistance == Int.max ? -1 : minDistance
    }
    
    func bfs(_ grid: [[Int]], _ row: Int, _ col: Int, _ totalBuildings: Int) -> Int {
        let (building, obstacle) =  (1, 2)
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var queue = [(row: row, col: col)]
        visited[row][col] = true
        var buildingReached = 0
        let directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
        var level = 0
        var distanceSum = 0
        
        while !queue.isEmpty && buildingReached != totalBuildings {
            let count = queue.count 
           
            for _ in 0..<count {
                let (row, col) = queue.removeFirst()
                
                if grid[row][col] == building {
                    buildingReached += 1
                    distanceSum += level
                    continue
                }
                
                for dir in directions {
                    let (nextRow, nextCol) = (row + dir[0], col + dir[1])
                    
                    if nextRow < 0
                    || nextRow >= grid.count
                    || nextCol < 0
                    || nextCol >= grid[0].count
                    || grid[nextRow][nextCol] == obstacle
                    || visited[nextRow][nextCol] { continue }
                    
                    visited[nextRow][nextCol] = true
                    queue.append((nextRow, nextCol))
                }
              
            }
            
            level += 1
        }
        
        if buildingReached != totalBuildings { return Int.max }
        return distanceSum
    }
}