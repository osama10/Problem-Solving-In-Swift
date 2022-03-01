class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        var rows = [0, 0 , 0]
        var cols = [0, 0 , 0]
        var diagonal = 0
        var antiDiagonal = 0
        
        for (i, move) in moves.enumerated() {
            let player = i % 2 == 0 ? 1 : -1
            let row = move[0]
            let col = move[1]
            
            rows[row] += player
            cols[col] += player
            
            if col == row {
                diagonal += player
            }
            
            if col + row == 2 {
                antiDiagonal += player
            }
            
            if abs(rows[row]) == 3 
            || abs(cols[col]) == 3
            || abs(diagonal) == 3
            || abs(antiDiagonal) == 3 {
                return player == 1 ? "A" : "B"
            }
        }

        return moves.count == 9 ? "Draw" : "Pending"
    }
    
}