class Solution {
    func checkZeroOnes(_ s: String) -> Bool {
        var startOfZero = 0
        var startOfOne = 0
        
        var maxLen0 = 0
        var maxLen1 = 0
        
        for (end, char) in s.enumerated() {
            
            if char == "0" {
                startOfOne = end + 1
            } else {
                startOfZero = end + 1
            }
            
            maxLen0 = max(maxLen0, end - startOfZero + 1)
            maxLen1 = max(maxLen1, end - startOfOne + 1)

        }
        
        return maxLen1 > maxLen0
    }
}