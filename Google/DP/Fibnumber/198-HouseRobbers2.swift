func robUtils(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        //var dp = Array(repeating: -1, count: nums.count)
        
        var n0 = nums[0]
        var n1 = max(nums[0], nums[1])
        
        for house in 2..<nums.count {
            let temp = n1
            n1 = max(n1, n0 + nums[house] )
            n0 = temp
        }
        
        return n1
    
}

func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    if nums.count == 2 { return max(nums[0], nums[1]) }
    
    let houseWithFirst = Array(nums.dropLast())
    let houseWithoutFirst = Array(nums.dropFirst())
    
    return max(robUtils(houseWithFirst), robUtils(houseWithoutFirst))
}

rob([2,3,2])
rob([1,2,3,1])
rob([1,2,3])
