func shortestCommonSuperSequemce(_ str1: String, _ str2: String) -> (Int, String) {
    let str1 = Array(str1)
    let str2 = Array(str2)

    var dp = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)
     
    for len1 in 0...str1.count {
        for len2 in 0...str2.count {
            if len1 == 0 {
                dp[len1][len2] = len2
            } else if len2 == 0 {
                dp[len1][len2] = len1
            } else if str1[len1 - 1] == str2[len2 - 1] {
                dp[len1][len2] = 1 + dp[len1 - 1][len2 - 1]
            } else {
                dp[len1][len2] = 1 + min(dp[len1 - 1][len2], dp[len1][len2 - 1])
            }
        }
    }
    
    var l1 = str1.count
    var l2 = str2.count
    var result = ""
    
    while l1 > 0 && l2 > 0 {
        if str1[l1 - 1] == str2[l2 - 1] {
            result = String(str1[l1 - 1]) + result
            l1 -= 1
            l2 -= 1
        } else if dp[l1 - 1][l2] < dp[l1][l2  - 1] {
            result = String(str1[l1 - 1]) + result
            l1 -= 1
        } else {
            result = String(str2[l2 - 1]) + result
            l2 -= 1
        }
    }
    
    while l1 > 0 {
        result = String(str1[l1 - 1]) + result
        l1 -= 1
    }

    while l2 > 0 {
        result = String(str2[l2 - 1]) + result
        l2 -= 1
    }
    
    return (dp[str1.count][str2.count], result)
}

shortestCommonSuperSequemce("geek", "eke")
shortestCommonSuperSequemce("AGGTAB", "GXTXAYB")
shortestCommonSuperSequemce("pear", "peach")
shortestCommonSuperSequemce("geek", "code")
