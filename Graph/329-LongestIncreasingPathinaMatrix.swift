class Solution {
  let directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    var memo = Array(repeating:
                            Array(repeating: 0, count: matrix[0].count),
                        count: matrix.count)
    
    var maxCount = Int.min
    
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            let possibleMaxCount = calCulateLongesPath(matrix, row, col, &memo)
            maxCount = max(maxCount, possibleMaxCount)
        }
    }
    
    return maxCount
}

func calCulateLongesPath(_ matrix: [[Int]], _ row: Int, _ col: Int, _ memo: inout [[Int]]) -> Int {
    
    if memo[row][col] != 0 {
        return memo[row][col]
    }
    
    let previousValue = matrix[row][col]
    
    var maxCount = 1
    
    for dir in directions {
        let nextRow = row + dir[0]
        let nextCol = col + dir[1]
        
         if nextRow < 0
        || nextRow >= matrix.count
        || nextCol < 0
        || nextCol >= matrix[0].count
        || previousValue >= matrix[nextRow][nextCol] {  continue }
        
        let pathCount = calCulateLongesPath(matrix, nextRow, nextCol, &memo) + 1
       
        maxCount = max(maxCount, pathCount)
    }
    
    memo[row][col] = maxCount
    return maxCount
}

}