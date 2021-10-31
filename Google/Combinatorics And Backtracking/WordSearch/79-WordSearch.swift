class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count
        let n = board[0].count
        let array = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == array[0] {
                    if dfs(m, n, i, j, &visited, 0, array, board) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func dfs(_ m: Int, _ n: Int, _ x: Int, _ y: Int, _ visited: inout [[Bool]], _ index: Int, _ array: [Character], _ board: [[Character]]) -> Bool {
        guard x < m, y < n, x >= 0, y >= 0 else { return false }
        
        if visited[x][y] {
            return false
        }
        
        if board[x][y] != array[index] {
            return false
        } 
        
        if index == array.count - 1 {
            return true
        }
        
        visited[x][y] = true 
        if dfs(m, n, x + 1, y, &visited, index + 1, array, board) 
        || dfs(m, n, x - 1, y, &visited, index + 1, array, board) 
        || dfs(m, n, x, y + 1, &visited, index + 1, array, board) 
        || dfs(m, n, x, y - 1, &visited, index + 1, array, board) {
            return true
        }
        visited[x][y] = false
        return false
    }
}