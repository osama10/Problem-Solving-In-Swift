class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var nonZeroIndex = 0
        var currIndex = 0
        
        while currIndex < nums.count {
            if nums[currIndex] != 0 {
                nums.swapAt(currIndex, nonZeroIndex)
                nonZeroIndex += 1
            }
            
            currIndex += 1
        }
    }
}