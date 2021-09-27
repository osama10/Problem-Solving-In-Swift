// time exceeding with dp 

func canJump(_ nums: [Int]) -> Bool {
    var memo: [Bool?] = Array(repeating: nil, count: nums.count)
    return canJump(nums, 0, &memo)
}

func canJump(_ nums:[Int], _ currentPos: Int, _ memo: inout [Bool?]) -> Bool {
   
    if currentPos >= nums.count - 1{
        return true
    }
    
    if nums[currentPos] == 0 {
        return false
    }
    
    if memo[currentPos] == nil {
        var start = currentPos + 1
        let end = currentPos + nums[currentPos]
        
        memo[currentPos] = false
       
        while start <= end {
           
            if canJump(nums, start, &memo) {
                memo[currentPos] = true
                return true
            }
            
            start += 1
            
        }
    }
    
    memo[currentPos] = false
    
    return false
}


// Optimized


func canJumpOptimized(_ nums: [Int]) -> Bool {
    if nums.count == 1 { return true }
    let dest = nums.count - 1
    var furthest = 0
    var current = 0
    
    while furthest >= current {
        let reach = current + nums[current]
        if reach >= dest { return true }
        furthest = max(furthest, reach)
        current += 1
    }
    
    return false
}
