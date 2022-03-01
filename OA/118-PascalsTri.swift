class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 { return [[1]] }
        
        var triangle = [[1]]
        
        for row in 2...numRows {
            let prevRow = triangle.last!
            var newRow = [1]
            
            for j in 1..<row-1 {
                newRow.append(prevRow[j - 1] + prevRow[j])
            }
            
            newRow.append(1)
            
            triangle.append(newRow)
        }
        
        return triangle
    }
}