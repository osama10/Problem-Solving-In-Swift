func minGroups(_ nums: [Int], _ k: Int) -> Int {
    let nums = nums.sorted()
    
    var start = 0
    var count = 1
    
    for end in 0..<nums.count {
        if nums[end] - nums[start] > k {
            start += 1
            count += 1
        }
    }
    
    return count
}
