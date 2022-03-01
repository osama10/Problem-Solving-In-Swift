    func maximumProduct(_ nums: [Int]) -> Int {
        if nums.count <= 3 { return nums.reduce(1, *) }
        let nums = nums.sorted()
        
        let last = nums.count - 1
        
        let product1 = nums[0] * nums[1] * nums[last]
        let product2 = nums[last - 2] * nums[last - 1] * nums[last]
        
        return max(product1, product2)
    }