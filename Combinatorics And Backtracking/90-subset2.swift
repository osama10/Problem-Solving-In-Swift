func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    let nums = nums.sorted()
    result.append([])
    var start = 0
    var end = 0
    
    for i in 0..<nums.count {
        start = 0
        
        if i > 0 && nums[i - 1] == nums[i] {
            start = end + 1
        }
        
        end = result.count - 1
        
        for j in start...end {
                var subset = result[j]
                subset.append(nums[i])
                result.append(subset)
        
         }
    }
    
    
    return result
}
