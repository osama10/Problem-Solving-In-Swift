class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
       var nums = nums
       var containsOne = false
       
        for num in nums {
            if num == 1 {
                containsOne = true
                break
            }
        }
        
        if !containsOne { 
            return 1
        }
        
        for i in 0..<nums.count {
            if nums[i] <= 0 || nums[i] > nums.count {
                nums[i] = 1
            }
        }
        
        for num in nums {
            let index = abs(num)
            if index == nums.count {
                nums[0] = -nums[0]
            } else {
                nums[index] = -abs(nums[index])
            }
        }
        
        for i in 1..<nums.count {
            if nums[i] > 0 {
                return i
            }
        }
        
        if nums[0] > 0 {
            return nums.count
        }
        
        return nums.count + 1
    }
}