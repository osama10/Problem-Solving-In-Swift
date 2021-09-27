func longestPalindrome(_ s: String) -> String {
    var dp : [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    let sArr = s.map{ String($0)}
    var row = 0
    var col = 0
    var maxLength = 1
    
    for i in 0..<s.count {
        dp[i][i] = true
    }
    
    for start in stride(from: s.count - 1, to: -1, by: -1) {
        for end in start + 1..<s.count {
            if sArr[start] == sArr[end] {
                if end - start == 1 || dp[start + 1][end - 1] {
                    let count = end - start + 1
                    dp[start][end] = true
                    if maxLength < count {
                        row = start
                        col = end
                        maxLength = count
                    }
                }
            }
        }
    }
        
    return sArr[row...col].reduce("", +)
}
