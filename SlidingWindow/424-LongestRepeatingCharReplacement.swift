class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var start = 0
        var repeatingcharCount = 0
        var dict = [Character: Int]()
        var length = 0
        let s = Array(s)
        
        for (end, char) in s.enumerated() {
            dict[char, default: 0] += 1
            repeatingcharCount = max(repeatingcharCount, dict[char]!)
            
            if (end - start + 1 - repeatingcharCount) > k {
                let key = s[start]
                dict[key]! -= 1
                start += 1
            }
            
            length = max(end - start + 1, length )
        }
        
        return length
    }
}