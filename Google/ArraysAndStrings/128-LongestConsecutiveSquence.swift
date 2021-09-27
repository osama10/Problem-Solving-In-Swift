class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var maxCount = 0
        var numSet = Set(nums)
        
        for num in nums {
            if !numSet.contains(num - 1) {
                var count = 1
                var next = num + 1
                
                while numSet.contains(next) {
                    next = next + 1
                    count += 1
                }
                
                maxCount = max(maxCount, count)
            }
        }
        
        return maxCount
    }
}