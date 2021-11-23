class Solution {
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    let nums = nums.sorted()

    if nums.count < 4 { return result }
    
    for first in 0...nums.count-4 {
        if first != 0 && nums[first - 1] == nums[first] { continue }
        for second in first+1...nums.count-3 {
            if second != first+1 && nums[second - 1] == nums[second] { continue }
            var left = second + 1
            var right = nums.count - 1
            
            while left < right {
                let sum = nums[left] + nums[right] + nums[first] + nums[second]
                
                if sum == target {
                    result.append([nums[first], nums[second], nums[left], nums[right]])
                    
                    left += 1
                    right -= 1
           
                    while left < right && nums[left - 1] == nums[left] { left += 1 }
                    while left < right && nums[right + 1] == nums[right] { right -= 1 }
                    
                } else if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    
    return result
}
}