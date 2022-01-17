class Solution {
    func maxPower(_ s: String) -> Int {
        var start = 0
        var set = Set<Character>()
        var maxLen = 0
        let s = Array(s)
        
        for (end, char) in s.enumerated() {
            set.insert(char)
            
            if set.count > 1 {
                set.remove(s[start])
                start = end
            }
            
            maxLen = max(maxLen, end - start + 1)
        }
        
        return maxLen
    }
}