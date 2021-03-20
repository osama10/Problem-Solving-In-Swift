func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {

    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
    let text1 = Array(text1), text2 = Array(text2)
    var length = 0
    var row = 0, col = 0

    for i in 0...text1.count {
        for j in 0...text2.count {
            if i == 0 || j == 0 { dp[i][j] = 0 }
            else if text1[i - 1] == text2[j - 1] {
                dp[i][j] = dp[i - 1][j-1] + 1
                if dp[i][j] > length {
                    length = dp[i][j]
                    row = i
                    col = j
                }
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j-1])
            }
        }
    }

    var subsequence = Array(repeating: Character("0"), count: length)

    while dp[row][col] != 0 {
        subsequence[length - 1] = text1[row - 1]
        length -= 1
        col -= 1
        row -=  1
    }

    print(subsequence.reduce(into: ""){ (partialString, value) in partialString.append(value)} )
    return dp[text1.count][text2.count]
}

longestCommonSubsequence("GEEKSFORGEEKS", "GEEKS")
