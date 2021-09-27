func orangesRotting(_ grid: [[Int]]) -> Int {
    var queue = [(row: Int, col: Int)]()
    var totalFreshOranges = 0
    let directions = [[0,1], [0,-1], [1,0], [-1,0]]
    var grid = grid
    var time = -1
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == 1 {
                totalFreshOranges += 1
            } else if grid[row][col] == 2 {
                queue.append((row, col))
            }
        }
    }
    
    queue.append((-1, -1))
    
    while !queue.isEmpty  {
        let (row, col) = queue.removeFirst()
        
        if row == -1 {
            time += 1
            if !queue.isEmpty {
                queue.append((-1, -1))
            }
        } else {
            for direction in directions {
                
                let nextRow = row + direction[0]
                let nextCol = col + direction[1]
                
                if notValid(nextRow,
                            nextCol,
                            grid.count,
                            grid[0].count)
                    || grid[nextRow][nextCol] != 1 {
                    continue
                }
                
                totalFreshOranges -= 1
                grid[nextRow][nextCol] = 2
                queue.append((nextRow, nextCol))
            }
        }
        
    }

    return totalFreshOranges == 0 ? time : -1
    
}

func notValid(_ row: Int, _ col: Int, _ totalRow: Int, _ totalCol: Int) -> Bool {
    row < 0 || col < 0 || row >= totalRow || col >= totalCol
}