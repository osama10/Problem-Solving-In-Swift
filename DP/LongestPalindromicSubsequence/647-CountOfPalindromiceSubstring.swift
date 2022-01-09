func countSubstrings(_ s: String) -> Int {
    var dp : [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    var count = 0
   
    for i in 0..<s.count {
        dp[i][i] = true
        count += 1
    }
    
    let sArr = Array(s)
    
    for start in stride(from: s.count - 1, to: -1, by: -1) {
        for end in start + 1..<s.count {
            if sArr[start] == sArr[end] {
                if end - start == 1 || dp[start + 1][end - 1] {
                    dp[start][end] = true
                    count += 1
                }
            }
        }
    }
    return count
}

