class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var start = 0
        var maxLength = 0
        
        for (end, value) in nums.enumerated() {
           
            if value == 0 {
                start = end + 1

            }
            
            maxLength = max(maxLength, end - start + 1)
        }
        
        return maxLength
    }
}