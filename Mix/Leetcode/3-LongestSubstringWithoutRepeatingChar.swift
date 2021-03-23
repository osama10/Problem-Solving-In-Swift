// 3
func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count < 2 { return s.count }
    var start = 0
    var indexMap = [Character: Int]()
    var result = Int.min

    for (index, char) in s.enumerated() {
        if let lastIndex = indexMap[char], start <= lastIndex {
            start = lastIndex + 1
        }
        result = max((index - start + 1), result)
        indexMap[char] = index
    }

    return result
}