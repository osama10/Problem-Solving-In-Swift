class Solution {
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        var maxLength = 0
        var dict = [Int: Int]()
        
        for (end, value) in nums.enumerated() {
            prefixSum += value
            
            if prefixSum == k {
                maxLength = end + 1
            }
            
            if let index = dict[prefixSum - k] {
                maxLength = max(end - index, maxLength)
            }
            
            if dict[prefixSum] == nil {
                dict[prefixSum] = end
            }
             
        }
        
        return maxLength
    }
}