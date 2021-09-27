func magicIndex(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if nums[mid] == mid {
            return mid
        } else if nums[mid] > mid {
            right = min(mid - 1, nums[mid])
        } else {
            left = max(mid + 1, nums[mid])
        }
    }
    
    return -1
}


magicIndex([0, 2, 3, 4, 5])
magicIndex([2, 2, 2, 2, 2])
