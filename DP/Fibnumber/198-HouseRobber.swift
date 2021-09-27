func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums[0] }
    var dp = Array(repeating: -1, count: nums.count)
    
    dp[0] = nums[0]
    dp[1] = max(nums[0], nums[1])
    
    for house in 2..<nums.count {
        dp[house] = max(dp[house - 1], dp[house - 2] + nums[house] )
    }
    
    
    return dp.max() ?? 0
}