class Solution {
   func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var minDiff = Int.max
    let nums = nums.sorted()
       
    for (index, value) in nums.enumerated() {
        var left = index + 1
        var right = nums.count - 1
        
        while left < right {
           
            let sum = nums[right] + nums[left] + value
            let diff = target - sum
           
            if  diff == 0 {
                return target
            }
            
            if abs(diff) < abs(minDiff) {
                minDiff = diff
            }
            
            if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    return target - minDiff
}



}