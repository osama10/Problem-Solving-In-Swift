class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        guard nums.count >= 5 else { return 0 }
        let nums = nums.sorted()
        
        var lastIndex = nums.count - 1
        
        // check removing first three 
        var minDiff = nums[lastIndex] - nums[3]
        
        // check removing first 2 and last 
        minDiff = min(minDiff, nums[lastIndex - 1] - nums[2])
        
        // check removing first  and last 2 
        minDiff = min(minDiff, nums[lastIndex - 2] - nums[1])
        
        // check removing last 3 
        minDiff = min(minDiff, nums[lastIndex - 3] - nums[0])
        
        return minDiff
    }
}


