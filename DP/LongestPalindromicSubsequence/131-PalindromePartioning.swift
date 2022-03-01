class Solution {
    func partition(_ s: String) -> [[String]] {
        var substr = [String]()
        var allSubstr = [[String]]()
        generateSubstring(Array(s), 0, &substr, &allSubstr)
        return allSubstr
    }
    
    func generateSubstring(_ str: [Character], _ start: Int, _ substr: inout [String], _ allSubstr: inout [[String]])  {
        if start == str.count {
            allSubstr.append(substr)
        } else {
            
            var partialStr = ""
            
            for index in start..<str.count {
                partialStr.append(str[index])
                if isPalindrome(start, index, str) {
                    substr.append(partialStr)
                    generateSubstring(str, index + 1, &substr, &allSubstr)
                    substr.removeLast()
                }
            }
        }

    }
    
    func isPalindrome(_ start: Int, _ end: Int, _ str: [Character]) -> Bool {
        var start = start 
        var end = end
        
        while start < end {
            if str[start] != str[end] { return false }
            start += 1
            end -= 1
        }
        
        return true
    }
}