class Solution {
    func candyCrush(_ board: [[Int]]) -> [[Int]] {
        var board = board
        var wasUnStable = false

        for row in 0..<board.count {
            for col in 0..<board[0].count-2 {
                let val = abs(board[row][col])
                if val > 0
                    && val == abs(board[row][col + 1])
                    && val == abs(board[row][col + 2]) {
                    board[row][col] = -val
                    board[row][col + 1] = -val
                    board[row][col + 2] = -val
                    wasUnStable = true
                }
            }
        }

        for row in 0..<board.count-2 {
            for col in 0..<board[0].count {
                let val = abs(board[row][col])

                if val > 0
                    && val == abs(board[row + 1][col])
                    && val == abs(board[row + 2][col]) {
                    board[row][col] = -val
                    board[row + 1][col] = -val
                    board[row + 2][col] = -val
                    wasUnStable = true
                }
            }
        }

        for col in 0..<board[0].count {
            var writePtr = board.count - 1

            for row in stride(from: board.count - 1, to: -1, by: -1) {
                if board[row][col] > 0 {
                    board[writePtr][col] = board[row][col]
                    writePtr -= 1
                }
            }

           while writePtr >= 0 {
                board[writePtr][col] = 0
               writePtr -= 1
            }
            
            
        }

        return wasUnStable ? candyCrush(board) : board
    }
}