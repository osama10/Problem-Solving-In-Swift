class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var closeBracketIndex = Set<Int>()
        var result = ""

        for (index, char) in s.enumerated() {
            if char == "(" {
                stack.append(index)
            } else if char == ")" {
                if stack.isEmpty {
                    closeBracketIndex.insert(index)
                } else {
                    stack.removeLast()
                }
            }
        }
        
        closeBracketIndex = closeBracketIndex.union(stack)
        
        for (index, char) in s.enumerated() {
            if !closeBracketIndex.contains(index) {
                result.append(char)
            }
        }
        
        return result
    }
    
}