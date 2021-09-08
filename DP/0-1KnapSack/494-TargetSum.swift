func calculateWays(_ nums: [Int],
                   _ target: Int,
                   _ currentSum: Int,
                   _ n: Int,
                   _ total: Int,
                   _ memo: inout [[Int]]) -> Int {
    
    if n == 0 {
        return target == currentSum ? 1 : 0
    }
    
    if memo[n][currentSum + total] != -1 { return memo[n][currentSum + total] }
    
    memo[n][currentSum + total] = calculateWays(nums,
                                                target,
                                                currentSum + nums[n - 1],
                                                n - 1,
                                                total,
                                                &memo) + calculateWays(nums,
                                                                       target,
                                                                       currentSum - nums[n - 1],
                                                                       n - 1,
                                                                       total,
                                                                       &memo)
    
    return memo[n][currentSum + total]
    
}

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let total = nums.reduce(0, +)
    var memo = Array(repeating: Array(repeating: -1, count: 2 * total + 1), count: nums.count + 1)
    return calculateWays(nums, target, 0, nums.count, total, &memo)
}

findTargetSumWays([1], 1)
