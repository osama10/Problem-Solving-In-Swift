class Solution {
var visited = Set<String>()

func solve(_ board: inout [[Character]]) {
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            if (row == 0 || col == 0 || row == board.count - 1 || col == board[0].count - 1) && board[row][col] == "O"{
                dfs(&board, row, col)
            }
        }
    }
    
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            board[row][col] = board[row][col] == "E" ? "O" : "X"
        }
    }
}

func dfs(_ board: inout [[Character]], _ row: Int, _ col: Int)  {
    if row < 0 || row >= board.count || col < 0 || col >= board[0].count { return }
        if board[row][col] != "O" { return }
        if visited.contains("\(row)-\(col)") { return  }

    board[row][col] = "E"
    visited.insert("\(row)-\(col)")
    
    dfs(&board, row + 1, col)
    dfs(&board, row - 1, col)
    dfs(&board, row, col + 1)
    dfs(&board, row, col - 1)
}

}