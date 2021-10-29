class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
         finalString(s) == finalString(t)
    }
    
    func finalString(_ string: String) -> String {
        guard !string.isEmpty else { return "" }
        var stack = [Character]()
        
        for char in string {
            if char != "#" {
                stack.append(char)
            } else {
                stack.popLast()
            }
        }
        
        return stack.isEmpty ? "" : String(String(stack))
    }
}