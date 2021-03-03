import Foundation

/// 3

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count < 2 { return s.count }
    var dict = [Character: Int]()
    var start = 0
    var maxSize = 0

    for (index, char) in s.enumerated() {
        if let val = dict[char], val >= start { start = val + 1 }
        dict[char] = index
        maxSize = max(maxSize, (index - start + 1))
    }
    return maxSize
}

lengthOfLongestSubstring("dvdf")
