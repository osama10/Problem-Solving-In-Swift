class Solution {
    var result = [String]()
    
    func expand(_ s: String) -> [String] {
        backtrack(Array(s), 0, "")
        return result.sorted()
    }
    
    func backtrack(_ expression: [Character], _ currIndex: Int, _ currExp: String) {
        
        if currIndex == expression.count {
            result.append(currExp)
            return
        } 
        
        if expression[currIndex].isLetter {
            
            backtrack(expression, currIndex + 1, currExp + String(expression[currIndex]))
        } else {
            var candidates = [Character]()
            var count = currIndex
            
            for i in currIndex..<expression.count {
                count = i
                let char = expression[i]
                if char.isLetter {
                    candidates.append(char)
                }
                
                if char == "}" {
                    break
                }
            }
            
            for candidate in candidates {
                backtrack(expression, count + 1, currExp + String(candidate))
            }
        }
    }
}