class Solution {
    
    var rowMap = [Int: Set<Character>]()
    var colMap = [Int: Set<Character>]()
    var boxMap = [String: Set<Character>]()
    
    let totalRow = 9
    let totalCol = 9
    
    func solveSudoku(_ board: inout [[Character]]) {
        
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if board[row][col] != "." {
                    let val = board[row][col]
                    rowMap[row, default: Set<Character>()].insert(val)
                    colMap[col, default: Set<Character>()].insert(val)
                    boxMap["\(row/3)-\(col/3)", default: Set<Character>()].insert(val)
                }
            }
        }

        func backtrack(_ row: Int, _ col: Int) -> Bool {
            var row = row
            var col = col
            
            if row == totalRow - 1 && col == totalCol {
                return true
            }
        
            if col == totalCol {
                 row +=  1
                 col = 0
            }
            
            if board[row][col] != "." {
                return backtrack(row, col + 1)
            }
        
            for num in 1...9 {
                let val = Character("\(num)")
                
                if !isValid(row, col, val) {
                    continue
                }
                
                board[row][col] = val
                
                rowMap[row, default: Set<Character>()].insert(val)
                colMap[col, default: Set<Character>()].insert(val)
                boxMap["\(row/3)-\(col/3)", default: Set<Character>()].insert(val)
                
                if backtrack(row, col + 1) {
                    return true
                }
                
                board[row][col] = "."
                
                rowMap[row, default: Set<Character>()].remove(val)
                colMap[col, default: Set<Character>()].remove(val)
                boxMap["\(row/3)-\(col/3)", default: Set<Character>()].remove(val)
            
            }
            
            return false
        
        }
        
        backtrack(0, 0)
        
    }
    
    func isValid(_ row: Int, _ col: Int, _ val: Character) -> Bool {
        let key = "\(row/3)-\(col/3)"
        
        let inRow = !rowMap[row, default: Set<Character>()].contains(val)
        let inCol = !colMap[col, default: Set<Character>()].contains(val)
        let inBox = !boxMap[key, default: Set<Character>()].contains(val)
        
        return inRow && inCol && inBox
    }


}