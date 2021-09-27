


func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
    let text1 = Array(text1), text2 = Array(text2)

    for i in 0...text1.count {
        for j in 0...text2.count {
            if i == 0 || j == 0 { dp[i][j] = 0 }
            else if text1[i - 1] == text2[j - 1] {
                dp[i][j] = dp[i - 1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j-1])
            }
        }
    }

    return dp[text1.count][text2.count]
}

func lcsRecursive(_ text1: String, _ text2: String) -> Int {
	  var cache = Array(repeating: Array(repeating: -1, count: text2.count + 1), count: text1.count + 1)
    	return lcsUtil(Array(text1), Array(text2), text1.count , text2.count , cache: &cache)
}

func lcsUtil( _ text1: Array<Character>, _ text2: Array<Character>, _ i : Int, _ j: Int, cache: inout [[Int]] ) -> Int {
    if i == 0 || j == 0 { return 0 }
    if cache[i][j] != -1 { return cache[i][j] }

    if text1[i] == text2[j] {
        cache[i][j] = 1 + lcsUtil(text1, text2, i - 1, j - 1, cache: &cache)
        return  cache[i][j]
    } else {
        cache[i][j] = max(lcsUtil(text1, text2, i - 1, j, cache: &cache), lcsUtil(text1, text2, i, j - 1, cache: &cache)  )
        return  cache[i][j]
    }
}

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


printLongestCommonSubseq("ABCDGH", "AEDFHR")
printLongestCommonSubseq("AGGTAB", "GTAB")
