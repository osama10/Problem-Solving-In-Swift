class Solution {
func findBall(_ grid: [[Int]]) -> [Int] {
    var result = [Int]()
   
    for col in 0..<grid[0].count {
        result.append(canFallOut(0, col, grid))
    }
    
    return result
}

func canFallOut(_ row: Int, _ col: Int, _ grid: [[Int]]) -> Int {
    if row == grid.count {
        return col
    }
    
    if isStuck(row, col, grid) {
        return -1
    }
    
    return canFallOut(row + 1, col + grid[row][col], grid)
}

func isStuck(_ row: Int, _ col: Int, _ grid: [[Int]]) -> Bool {
    if col == 0 && grid[row][col] == -1
    || col == grid[0].count - 1 && grid[row][col] == 1
    || grid[row][col] == 1 && grid[row][col + 1] == -1
    || grid[row][col] == -1 && grid[row][col - 1] == 1 {
        return true
    }
    
    return false
}
}

