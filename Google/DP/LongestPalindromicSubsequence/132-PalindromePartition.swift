    func minCut(_ s: String) -> Int {
        let s = s.map{ String($0) }
    var isPalindromeMemo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: s.count), count: s.count)
    var memo = Array(repeating: Array(repeating: -1, count: s.count), count: s.count)
    return findMPPCutsRecursive(s, 0, s.count - 1, &memo, &isPalindromeMemo)
    }
    
    
func findMPPCutsRecursive(_ strArr: [String],
                          _ start: Int,
                          _ end: Int,
                          _ memo: inout [[Int]],
                          _ isPalindromeMemo: inout [[Bool?]]) -> Int {
   
    if end >= strArr.count || isPalindrome(strArr, start, end, &isPalindromeMemo) {
        return 0
    }
    
    if memo[start][end] == -1 {
        var minCuts = end - start
        for i in start...end {
            if isPalindrome(strArr, start, i, &isPalindromeMemo) {
                minCuts = min(minCuts, 1 + findMPPCutsRecursive(strArr,
                                                              i + 1,
                                                              end,
                                                              &memo,
                                                              &isPalindromeMemo))
                
            }
        }
        
        memo[start][end] = minCuts
    }
    
    return memo[start][end]
}


func isPalindrome(_ strArr: [String], _ start: Int, _ end: Int, _ isPalindromeMemo: inout [[Bool?]]) -> Bool {
   
    if isPalindromeMemo[start][end] == nil {
       
        isPalindromeMemo[start][end] = true
        
        var currStart = start
        var currEnd = end
        
        while currStart < currEnd {
            if strArr[currStart] != strArr[currEnd] {
                isPalindromeMemo[start][end] = false
                break
            }
            
            currStart += 1
            currEnd -= 1
            
            if currStart < currEnd && isPalindromeMemo[currStart][currEnd] != nil {
                isPalindromeMemo[start][end] = isPalindromeMemo[currStart][currEnd]
                break
            }
        }
    }
    
    return isPalindromeMemo[start][end] ?? false
}