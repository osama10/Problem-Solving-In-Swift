


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
