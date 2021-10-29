class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var windowStart = 0
        var maxLength = 0
        var dict = [Character: Int]()
        let s = Array(s)
        
        for (windowEnd, char) in s.enumerated() {
            dict[char, default: 0] += 1
            
            if dict.keys.count > k {
                while windowStart <= windowEnd && dict.keys.count > k {
                   
                    dict[s[windowStart], default: 0] -= 1
                    
                    if dict[s[windowStart]] == 0 {
                        dict[s[windowStart]] = nil
                    }
                     
                    windowStart += 1
                }
                
            }
            maxLength = max(windowEnd - windowStart + 1, maxLength)

        }
        
        return maxLength
    }
}

class Solution2 {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var windowStart = 0
        var maxLength = 0
        var dict = [Character: Int]()
        let s = Array(s)
        
        for (end, char) in s.enumerated() {
            dict[char, default: 0] = end
            
            if dict.keys.count == k + 1 {
                let minKey = Array(dict.values).min()!
                dict.removeValue(forKey: s[minKey])
                windowStart = minKey + 1
            }
            
            maxLength = max(end - windowStart + 1, maxLength)
        }
        
        return maxLength
    }
}
