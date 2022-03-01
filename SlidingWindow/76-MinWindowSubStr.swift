// https://leetcode.com/problems/minimum-window-substring/discuss/1751319/Java.-ShrinkingExpanding-window.-Easy-to-follow.

class Solution {
func minWindow(_ s: String, _ t: String) -> String {
    var tFreq = [Character: Int]()
    let sArr = Array(s)

    var tCharFoundCount = 0
    var minStart = 0
    var minEnd = 0
    var start = 0
    var end = 0
    var minLen = Int.max
    
    for char in t {
        tFreq[char, default: 0] += 1
    }
    
    while end < s.count {
        while end < s.count && tCharFoundCount != t.count {
            tFreq[sArr[end], default: 0] -= 1
            
            if let freq = tFreq[sArr[end]], freq >= 0 {
                tCharFoundCount += 1
            }
            
            end += 1
        }
        
        while start < s.count && tCharFoundCount == t.count {
            
            if (end - start + 1) < minLen {
                minLen = end - start + 1
                minEnd = end
                minStart = start
            }

            tFreq[sArr[start], default: 0] += 1
            
            if let freq = tFreq[sArr[start]], freq > 0 {
                tCharFoundCount -= 1
            }

            start += 1
        }
    }

    return String(sArr[minStart..<minEnd])
}
}