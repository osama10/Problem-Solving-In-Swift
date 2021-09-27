func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let text1 = Array(text1)
    let text2 = Array(text2)
    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

    
    for l1 in 1...text1.count {
        for l2 in 1...text2.count {
            if text1[l1 - 1] == text2[l2 - 1] {
                dp[l1][l2] = dp[l1 - 1][l2 - 1] + 1
            } else {
                dp[l1][l2] = max(dp[l1 - 1][l2], dp[l1][l2 - 1])
            }
        }
    }
    return dp[text1.count][text2.count]
}

func findMDI(_ str1: String, _ str2: String) -> (deletes: Int, inserts: Int) {
    let maxSubseqLength = longestCommonSubsequence(str1, str2)
    return (str1.count - maxSubseqLength, str2.count - maxSubseqLength)
}