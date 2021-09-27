// Deletion Insertion and K palindromic

func minInsertions(_ s: String) -> Int {
    let s = Array(s)
    var memo = Array(repeating: Array(repeating: -1, count: s.count), count: s.count)
    let longestPalindrome = findLPSRecursive(s, 0, s.count - 1, &memo)
    return s.count - longestPalindrome
}
    
    func findLPSRecursive(_ string: Array<String.Element>, _ startIndex: Int, _ endIndex: Int, _ memo: inout [[Int]]) -> Int {
    
    if startIndex == endIndex {
        return 1
    }
    
    if startIndex > endIndex {
        return 0
    }
    
    if memo[startIndex][endIndex] == -1 {
        if string[startIndex] == string[endIndex] {
            memo[startIndex][endIndex] = 2 + findLPSRecursive(string, startIndex + 1, endIndex - 1, &memo)
        } else {
            let length1 = findLPSRecursive(string, startIndex + 1, endIndex, &memo)
            let length2 = findLPSRecursive(string, startIndex, endIndex - 1, &memo)
            memo[startIndex][endIndex] = max(length1, length2)
        }
    }
    
    return memo[startIndex][endIndex]
}