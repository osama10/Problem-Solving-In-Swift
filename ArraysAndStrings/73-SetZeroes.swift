class Solution {
func setZeroes(_ matrix: inout [[Int]]) {
    var firstColHasZeroes = false
    
    // checking rest of the matrix
    for row in 0..<matrix.count {
        
        if matrix[row][0] == 0 {
            firstColHasZeroes = true
        } 
        
        for col in 1..<matrix[0].count {
            if matrix[row][col] == 0 {
                matrix[0][col] = 0
                matrix[row][0] = 0
            }
        }
    }
    
    for row in 1..<matrix.count {
        for col in 1..<matrix[0].count {
            if matrix[0][col] == 0 || matrix[row][0] == 0{
                matrix[row][col] = 0
            }
        }
    }
    
    if firstColHasZeroes {
        for row in 0..<matrix.count {
             matrix[row][0] == 0
            
        }
    }
    
    if matrix[0][0] == 0 {
        for col in 0..<matrix[0].count {
            matrix[0][col] = 0
        }
    }
    
}

}