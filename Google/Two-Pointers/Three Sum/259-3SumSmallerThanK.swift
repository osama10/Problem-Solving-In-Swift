class Solution {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
       var count = 0
        let nums = nums.sorted()
        
        func findNum(_ left: Int, _ right: Int, _ target: Int) {
            var left = left
            var right = right 
            
            while left < right {
                let sum = nums[left] + nums[right] 
                if sum < target {
                    count += right - left
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        for (index, num) in nums.enumerated() {
            findNum(index + 1, nums.count - 1, target - num)
        }
        
        return count
    }
}