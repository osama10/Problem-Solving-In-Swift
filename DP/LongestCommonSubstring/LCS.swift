
/// https://www.geeksforgeeks.org/longest-common-substring-dp-29/
func longestCommonSubstring(_ text1: String, _ text2: String) -> Int {
    let text1 = Array(text1)
    let text2 = Array(text2)
    var result = 0
    var row = 0, col = 0
    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

    for i in 0..<text1.count {
        for j in 0..<text2.count {
            if i == 0 || j == 0 { dp[i][j] = 0 }
            else if text1[i - 1] == text2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
                if result < dp[i][j] {
                    result = dp[i][j]
                    row = i
                    col = j
                }
            }
            else { dp[i][j] = 0 }
        }
    }

    var subsequence = Array(repeating: Character("0"), count: result)
    var length = result

    while dp[row][col] != 0 {
        subsequence[length - 1] = text1[row - 1]
        length -= 1
        col -= 1
        row -=  1
    }
    print(subsequence.reduce(into: ""){ (partialString, value) in partialString.append(value)} )
    return result
}


longestCommonSubstring("zxabcdezy", "yzabcdezx")