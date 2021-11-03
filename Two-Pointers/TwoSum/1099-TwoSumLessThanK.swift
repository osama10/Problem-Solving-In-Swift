class Solution {
    func twoSumLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else { return -1 }
        
        let nums = nums.sorted()
        var left = 0
        var right = nums.count - 1
        var maxSum = Int.min
        
        while left < right {
            let sum = nums[left] + nums[right]
            if sum < k {
                maxSum = max(maxSum, sum)
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxSum == Int.min ? -1 : maxSum
    }
}