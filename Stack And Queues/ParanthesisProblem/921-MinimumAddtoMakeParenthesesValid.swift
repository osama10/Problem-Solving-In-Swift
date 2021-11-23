class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var count = 0
        var stack = [Character]()
        
        for char in s {
            if char == "(" {
                stack.append("(")
            } else {
                if !stack.isEmpty {
                    stack.removeLast()
                } else {
                    count += 1
                }
            }
        }
        
        return count + stack.count
    }
}