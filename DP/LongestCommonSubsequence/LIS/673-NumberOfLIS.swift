  func findNumberOfLIS(_ nums: [Int]) -> Int {
     var dp = Array(repeating: 1, count: nums.count)
    var count = Array(repeating: 1, count: nums.count)
    var maxSubseq = 1
    
    for i in 1..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] && dp[i] <= dp[j]{
                dp[i] = dp[j] + 1
                maxSubseq = max(maxSubseq, dp[i])
                count[i] = count[j]
            } else if dp[i] == dp[j] + 1 {
                count[i] += count[j]
            }
        }
    }
    
    var counter = 0
    
    for i in 0..<dp.count {
        if dp[i] == maxSubseq {
            counter += count[i]
        }
    }
    
    return counter
    }