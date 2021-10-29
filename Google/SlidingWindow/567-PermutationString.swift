class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var start = 0
        
        var dict = [Character: Int]()
       
        let s2 = Array(s2)
        
        var matched = 0
        
        for char in s1 {
            dict[char, default: 0] += 1 
        }
        
        
        for (end, char) in s2.enumerated() {
            
            if dict[char] != nil  {
                dict[char]! -= 1
                
                if dict[char] == 0 { matched += 1 }
            
            }
            
            if dict.keys.count == matched { return true }
            
            
            if end >= s1.count - 1 {
                let firstChar = s2[start]
                start += 1
                
                if dict[firstChar] != nil {
                    if dict[firstChar] == 0 {
                    matched -= 1 
                }
                
                dict[firstChar, default: 0] += 1
                }
            
            }
            
        }
        
        return false
    }
}