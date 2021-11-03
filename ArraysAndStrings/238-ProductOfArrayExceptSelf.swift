class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var left = Array(repeating: 1, count: nums.count)
        var right = Array(repeating: 1, count: nums.count)
    
        var result = [Int]()
        
        for i in 1..<nums.count {
            left[i] = left[i - 1] * nums[i - 1]
        }
        
        for i in stride(from: nums.count - 2, to: -1, by: -1) {
            right[i] = right[i + 1] * nums[i + 1]
        }
        
        for i in 0..<nums.count {
            result.append(right[i] * left[i])
        }
        
        return result
    }
}