func findMSIS(_ nums: [Int]) -> Int {
    var dp = Array(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    
    for i in 1..<nums.count {
        dp[i] = nums[i]
        
        for j in 0..<i {
            if nums[i] > nums[j] && dp[i] < dp[j] + nums[i] {
                dp[i] = dp[j] + nums[i]
            }
        }
    }
    
    return dp.max() ?? 0
}

findMSIS([4,1,2,6,10,1,12])
findMSIS([-4,10,3,7,15])
findMSIS([1,3,8,4,14,6,14,1,9,4,13,3,11,17,29])
