func lengthOfLIS(_ nums: [Int]) -> Int {
    
    var dp = Array(repeating: 1, count: nums.count)
    var maxSubseq = 1

    for end in 1..<nums.count {
        for start in 0..<end {
            if nums[end] > nums[start] && dp[end] <= dp[start] {
                dp[end] = dp[start] + 1
                maxSubseq = max(maxSubseq, dp[end])
            }
        }
    }
    
    return maxSubseq
 }
