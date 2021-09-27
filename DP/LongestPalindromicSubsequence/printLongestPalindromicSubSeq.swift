func printLongestCommonSubseq(_ str1: String, _ str2: String) -> String {
    let str1 = Array(str1)
    let str2 = Array(str2)

    var dp = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)
    
    for i in 1...str1.count {
        for j in 1...str2.count {
            if str1[i - 1] == str2[j - 1] {
                dp[i][j] = 1 + dp[i - 1][j - 1]
            } else {
                dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
            }
        }
    }
    
    var res = ""
    var l1 = str1.count
    var l2 = str2.count
    
    while l1 > 0 && l2 > 0 {
        if str1[l1 - 1] == str2[l2 - 1] {
            res = String(str1[l1 - 1]) + res
            l1 -= 1
            l2 -= 1
        } else if dp[l1][l2 - 1] > dp[l1 - 1][l2] {
            l2 -= 1
        } else {
            l1 -= 1
        }
    }
    
    return res
}


func printLongestPalindromicSubsequence(_ str: String) -> String {
    printLongestCommonSubseq(str, String(str.reversed()))
}

printLongestPalindromicSubsequence("forgeeksskeegfor")
printLongestPalindromicSubsequence("Geeks")
printLongestPalindromicSubsequence("GEEKSFORGEEKS")
