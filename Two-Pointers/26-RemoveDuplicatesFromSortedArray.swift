class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else {  return 0 }
        var nextNonDuplicateIndex = 1
        
        for (index, value) in nums[1..<nums.count].enumerated() {
            if nums[nextNonDuplicateIndex - 1] != value {
                nums[nextNonDuplicateIndex] = value
                nextNonDuplicateIndex += 1
            }
        }
        
        return nextNonDuplicateIndex 
    }
}