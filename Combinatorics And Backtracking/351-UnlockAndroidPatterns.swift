class Solution {
func numberOfPatterns(_ m: Int, _ n: Int) -> Int {
    let case1 = Set([1, 3, 7, 9])
    let case2 = Set([2, 4, 6, 8])
    var totalPatterns = 0
    var visited = Array(repeating: false, count: 10)
    
    func findNumberOfValidPatterns(_ currTotal: Int, _ currNum: Int) {
        if currTotal > n {
            return
        }
        
        if currTotal >= m {
            totalPatterns += 1
        }
        
        visited[currNum] = true
        
        for nextNum in 1...9 {
            if visited[nextNum] { continue }
            
            if case1.contains(currNum)
                && case1.contains(nextNum)
                && !visited[(currNum + nextNum)/2]
            { continue }
            
            if case2.contains(currNum) && currNum + nextNum == 10 && !visited[5] {
                continue
            }
            
            findNumberOfValidPatterns(currTotal + 1, nextNum)
        }
        
        visited[currNum] = false
    }
    
    for num in 1...9 {
        findNumberOfValidPatterns(1, num)
    }
    
    return totalPatterns
}
}
