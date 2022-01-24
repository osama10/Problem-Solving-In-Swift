class Solution1 {
// O N*K
    func getModifiedArray(_ length: Int, _ updates: [[Int]]) -> [Int] {
        var result = Array(repeating: 0, count: length)
        
        for update in updates {
            let start = update[0]
            let end = update[1]
            let inc = update[2]
            
            for i in start...end {
                result[i] += inc
            }
        }
        
        return result
    }
}

class Solution2 {
// O N + K
    func getModifiedArray(_ length: Int, _ updates: [[Int]]) -> [Int] {
        var result = Array(repeating: 0, count: length)
        
        for update in updates {
            let start = update[0]
            let end = update[1]
            let inc = update[2]
            result[start] += inc
            
            if end < result.count - 1 {
                result[end + 1] -= inc
            }
           
        }
        
        for i in 1..<result.count {
            result[i] = result[i - 1] + result[i]
        }
        
        return result
    }
}