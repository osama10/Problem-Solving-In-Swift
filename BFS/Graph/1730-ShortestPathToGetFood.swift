class Solution {
    
let myLocation: Character = "*"
let food: Character = "#"
let freeSpace: Character = "O"
let obstacle: Character = "X"
let directions = [[1,0], [-1, 0], [0, 1], [0, -1]]

func getFood(_ grid: [[Character]]) -> Int {
    var visited = Array(repeating:
                            Array(repeating: false, count: grid[0].count),
                        count: grid.count)
    let maxRow = grid.count
    let maxCol = grid[0].count
    var steps = 0
    var queue = [(row: Int, col: Int)]()
    
    for row in 0..<maxRow{
        for col in 0..<maxCol {
            if grid[row][col] == myLocation {
                queue.append((row,col))
                visited[row][col] = true
                break
            }
        }
        
        if !queue.isEmpty { break }
    }
    
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let (row, col) = queue.removeFirst()
            
            if grid[row][col] == food {
                return steps
            }
            
            for dir in directions {
                let nextRow = row + dir[0]
                let nextCol = col + dir[1]
                
                if nextRow < 0 || nextRow >= maxRow || nextCol < 0 || nextCol >= maxCol {
                    continue
                }
                
                if visited[nextRow][nextCol] { continue }
                
                if grid[nextRow][nextCol] == obstacle { continue }
                
                visited[nextRow][nextCol] = true
                queue.append((nextRow, nextCol))
            }
        }
        
        steps += 1
    }
    
    return -1
}
}