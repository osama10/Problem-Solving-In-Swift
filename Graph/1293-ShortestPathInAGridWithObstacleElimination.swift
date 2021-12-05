class Solution {
let directions = [[0, 1], [0, -1], [-1, 0], [1, 0]]

func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
    var queue = [(k: k, row: 0, col: 0)]
    var visited = Array(repeating: 
                        Array(repeating:
                              Array(repeating: false, count: grid[0].count), 
                              count: grid.count), 
                        count: k+1)
    
    visited[k][0][0] = true
    var steps = 0
   
    while !queue.isEmpty {
        var count = queue.count 
        
        for _ in 0..<count {
            let (remainK, row, col) = queue.removeFirst()
        
            if row == grid.count - 1 && col == grid[0].count - 1{
                return steps
            }
        
            for dir in directions {
            
                let newRow = row + dir[0]
                let newCol = col + dir[1]
            
                if isNotValid(newRow, newCol, grid.count, grid[0].count) {
                   continue
                }
            
                var newK = remainK
                
                if grid[newRow][newCol] == 1 {
                    newK -= 1
                }
            
                if newK >= 0  && !visited[newK][newRow][newCol] {
                    visited[newK][newRow][newCol] = true
                    queue.append((newK, newRow,newCol))
                }
        }
        
        }
        
        steps += 1
     
    }
    
    return -1
}

func isNotValid(_ row: Int, _ col: Int, _ maxRow: Int, _ maxCol: Int) -> Bool {
    row < 0 || row >= maxRow || col < 0 || col >= maxCol
}
}