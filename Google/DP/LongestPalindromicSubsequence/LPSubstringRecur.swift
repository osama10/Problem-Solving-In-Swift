func findLongestPalindromicSubstringRecursive(_ string: Array<String.Element>, _ startIndex: Int, _ endIndex: Int, _ memo: inout [[Int]]) -> Int {
    
    if startIndex == endIndex {
        return 1
    }
    
    if startIndex > endIndex {
        return 0
    }
    
    if memo[startIndex][endIndex] == -1 {
        
        if string[startIndex] == string[endIndex] {
            let substringLength = endIndex - startIndex - 1
            let palindromicLength = findLongestPalindromicSubstringRecursive(string, startIndex + 1, endIndex - 1, &memo)
                      
            if substringLength == palindromicLength {
                memo[startIndex][endIndex] = 2 + substringLength
                return memo[startIndex][endIndex]
            }
        }
           
        let length1 = findLongestPalindromicSubstringRecursive(string, startIndex + 1, endIndex, &memo)
        let length2 = findLongestPalindromicSubstringRecursive(string, startIndex, endIndex - 1, &memo)
        memo[startIndex][endIndex] = max(length1, length2)
    }
    
    return memo[startIndex][endIndex]
}

func longestPalindrome(_ s: String) -> Int {
    let s = Array(s)
    var memo = Array(repeating: Array(repeating: -1, count: s.count), count: s.count)
    return findLongestPalindromicSubstringRecursive(s, 0, s.count - 1, &memo)
}

longestPalindrome("abdbca")
longestPalindrome("cddpd")
longestPalindrome("pqr")
longestPalindrome("babad")
longestPalindrome("cbbd")
longestPalindrome("a")
longestPalindrome("ac")