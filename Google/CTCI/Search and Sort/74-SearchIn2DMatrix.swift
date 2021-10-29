class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty { return false }
        let m = matrix.count
        let n = matrix[0].count
        var end = m * n - 1
        var start = 0
        
        while start <= end {
            let mid = start + (end - start) / 2
            let midValue = matrix[mid / n][mid % n]
            if midValue == target {
                return true
            }else if midValue > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return false 
    }
}