// https://leetcode.com/discuss/interview-question/1373943/microsoft-oa-sde-2

var visited = [String: Bool]()
var set = Set<String>()

public func solution(_ R : inout [String]) -> Int {
    var board = [[Character]]()
    
    for row in R {
        let row = Array(row)
        board.append(row)
    }
    
    dfs(board, 0, 0, 0)
    return set.count
}


func dfs(_ board: [[Character]], _ row: Int, _ col: Int, _ direction: Int) {
    let key = "\(row)-\(col)-\(direction)"
    if let isVisited = visited[key], isVisited {
        return
    }
    
    if(row  == board.count || row == -1 || col == -1 || col == board[0].count) {
        if (row == board.count) {
               // current direction is down
               dfs(board, row - 1, col, 2)
           } else if (row == -1) {
               //current direction is up
               dfs(board, row + 1, col, 0)
           } else if (col == board[0].count) {
               //current direction is right
               dfs(board, row, col - 1, 1)
           } else if (col == -1) {
               //current direction is left
               dfs(board, row, col + 1, 3)
           }
           return;
    }
    
    visited[key] = true
        if(board[row][col] != "X") {
            //keep moving in the same direction
            set.insert("\(row)-\(col)")
            
            if(direction == 0) {
                dfs(board , row, col + 1 , 0)
            }
            else if(direction == 1) {
                dfs(board , row + 1, col , 1)
            }
            else if(direction==2) {
                dfs(board , row, col - 1 , 2)
            }
            else {
                dfs(board , row - 1, col , 3)
            }
        }else {
            //Same as edge case : go to prev x,y and change direction
            if(direction == 0) {
                dfs(board , row, col - 1 , 1)
            }
            else if(direction == 1) {
                dfs(board , row - 1, col , 2)
            }
            else if(direction == 2) {
                dfs(board , row, col + 1 , 3)
            }
            else {
                dfs(board , row + 1, col , 0)
            }
        }
}
