class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet = Array(repeating: Set<Character>(), count: board.count)
        var colSet = Array(repeating: Set<Character>(), count: board[0].count)
        var boxSet = [String: Set<Character>]()
        
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                let char = board[row][col]
                
                if char == "." { continue }
                
                if rowSet[row].contains(char) {
                    return false
                }
                
                rowSet[row].insert(char)
                
                if colSet[col].contains(char) {
                    return false
                }
                
                colSet[col].insert(char)
                
                if boxSet[boxKey(row,col), default: Set<Character>()].contains(char) {
                    return false
                }
                
                boxSet[boxKey(row,col), default: Set<Character>()].insert(char)
            }
        }
        
        return true
    }
    
    func boxKey(_ row: Int, _ col: Int) -> String { "\(row/3)-\(col/3)" }
}