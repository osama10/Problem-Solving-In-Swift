class TicTacToe {
    
    var rows: [Int]
    var cols: [Int]
    var diagonal = 0
    var antiDiagonal = 0
    
    init(_ n: Int) {
        rows = Array(repeating: 0, count: n)
        cols = Array(repeating: 0, count: n)
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let currentPlayer = player == 1 ?  1 : -1
        
        rows[row] += currentPlayer
        cols[col] += currentPlayer
        
        if row == col {
            diagonal += currentPlayer
        }
        
        if col == cols.count - row - 1 {
            antiDiagonal += currentPlayer
        }
        
        if abs(diagonal) == rows.count 
        || abs(antiDiagonal) == cols.count 
        || abs(rows[row]) == rows.count 
        || abs(cols[col]) == cols.count {
            return player
        }
        
        return 0
    }
}

/**
 * Your TicTacToe object will be instantiated and called as such:
 * let obj = TicTacToe(n)
 * let ret_1: Int = obj.move(row, col, player)
 */