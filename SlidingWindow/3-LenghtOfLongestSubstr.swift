func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        var str = Array(s)
        var start = 0
        var end = 0
        var seen = [Character: Int]()
        var maxLength = Int.min
        
        for (index, char) in s.enumerated() {
            if let lastIndex = seen[char], start <= lastIndex {
                start = lastIndex + 1
            }
            
            maxLength = max(index - start + 1, maxLength)
            seen[char] = index
        }
        
        return maxLength
    }