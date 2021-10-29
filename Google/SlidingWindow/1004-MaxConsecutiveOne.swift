class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var start = 0
        var maxRepatingOneCount = 0
        var length = 0
        
        for (end, value) in nums.enumerated() {
            if value == 1 {
                maxRepatingOneCount += 1
            }
            
            if end - start + 1 - maxRepatingOneCount > k {
                if nums[start] == 1 {
                    maxRepatingOneCount -= 1
                }
                
                start += 1
            }
            
            length = max(length, end - start + 1)
        }
        
        return length
    }
}