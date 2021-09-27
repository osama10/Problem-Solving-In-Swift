func getLongestPalindromicSubstringRecursive(_ string: [String], _ startIndex: Int, _ endIndex: Int, _ memo: inout [[String]]) -> String {

    if startIndex == endIndex {
        return string[startIndex]
    }

    if startIndex > endIndex {
        return ""
    }

    if memo[startIndex][endIndex] == "-1" {

        if string[startIndex] == string[endIndex] {
            let substringLength = endIndex - startIndex - 1
            let palindromicString = getLongestPalindromicSubstringRecursive(string, startIndex + 1, endIndex - 1, &memo)

            if substringLength == palindromicString.count {

                memo[startIndex][endIndex] = string[startIndex] + palindromicString + string[endIndex]

                return memo[startIndex][endIndex]
            }
        }

        let str1 = getLongestPalindromicSubstringRecursive(string, startIndex + 1, endIndex, &memo)
        let str2 = getLongestPalindromicSubstringRecursive(string, startIndex, endIndex - 1, &memo)

        memo[startIndex][endIndex] = str1.count > str2.count ? str1 : str2
    }

    return memo[startIndex][endIndex]
}

func longestPalindrome(_ s: String) -> String {
    let s = s.map{ String($0) }
    var memo = Array(repeating: Array(repeating: "-1", count: s.count), count: s.count)
    return getLongestPalindromicSubstringRecursive(s, 0, s.count - 1, &memo)
}

longestPalindrome("abdbca")
longestPalindrome("cddpd")
longestPalindrome("pqr")
longestPalindrome("babad")
longestPalindrome("cbbd")
longestPalindrome("a")
longestPalindrome("ac")