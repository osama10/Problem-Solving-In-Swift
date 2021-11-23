class Solution {
func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return [] }
    let nums = nums.sorted()
    
   var result = [[Int]]()

    func twoSum(_ left: Int, _ right: Int, _ target: Int) {
        var left = left
        var right = right
        
        while left < right {
            let sum = nums[left] + nums[right]
            
            if sum == target {
                result.append([-target, nums[left], nums[right] ])
                left += 1
                right -= 1
                while left < right && nums[left - 1] == nums[left] { left += 1 }
                while left < right && nums[right + 1] == nums[right] { right -= 1 }

            } else if target > sum {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    for (i, num) in nums.enumerated() {
        if i != 0 && nums[i - 1] == nums[i] { continue }
          twoSum(i + 1, nums.count-1, -num)
    }
    
    return result
}

}
