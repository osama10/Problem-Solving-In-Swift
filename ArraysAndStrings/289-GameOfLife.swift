class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        var nextState = board
        
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                let criteria = board[row][col] == 0 ? { $0 == 3 } : { $0 == 2 || $0 == 3 }
                nextState[row][col] = checkIfCellAlive(row, col, &board, criteria) ? 1 : 0
            }
        }
        
        board = nextState
    }
    
    func checkIfCellAlive(_ row: Int, _ col: Int, _ board: inout [[Int]], _ criteria: (Int) -> Bool) -> Bool {
        var totalAliveNeigbors = 0
        
        for nextRow in row-1...row+1 {
            for nextCol in col-1...col+1 {
                if (nextRow < 0 || nextRow >= board.count || nextCol < 0 || nextCol >= board[0].count) {
                    continue
                }
                
                if row == nextRow && col == nextCol { continue }
                
                if board[nextRow][nextCol] == 1 {
                    totalAliveNeigbors += 1
                }
            }
        }
        
        return criteria(totalAliveNeigbors)
    }
    
}