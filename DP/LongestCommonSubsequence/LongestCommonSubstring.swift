
func longestCommonSubstring(_ text1: String, _ text2: String) -> (Int,String) {
    let text1 = Array(text1)
    let text2 = Array(text2)
    
    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
    
    var maxLength = 0
    var row = 0
    var col = 0
    
    for l1 in 1...text1.count {
        for l2 in 1...text2.count {
            if text1[l1 - 1] == text2[l2 - 1] {
                dp[l1][l2] = dp[l1 - 1][l2 - 1] + 1
                if maxLength < dp[l1][l2] {
                    maxLength =  dp[l1][l2]
                    row = l1
                    col = l2
                }
            }
        }
    }
    
    var result = ""
    
    while dp[row][col] != 0 {
        result = String(text1[row - 1]) + result
        row -= 1
        col -= 1
    }
        
    return (maxLength, result)
}


longestCommonSubstring("abdca", "cbda")
longestCommonSubstring("passport", "ppsspt")
longestCommonSubstring("GeeksforGeeks", "GeeksQuiz")
longestCommonSubstring("zxabcdezy", "yzabcdezx")
