class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var left = 0
        var right = nums.count - 1
        var count = nums.count - 1
        var result = Array(repeating: 0, count: nums.count)
        let nums = nums.map { $0 * $0 }

        while count >= 0 {
            if nums[left] > nums[right] {
                result[count] = nums[left]
                left += 1
            } else {
                result[count] = nums[right]
                right -= 1
            }
            
            count -= 1
        }
        
        return result
    }
}