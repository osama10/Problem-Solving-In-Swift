class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        
        while start < end {
            let mid = start + (end - start) / 2
           
            if nums[mid] > nums[mid + 1] {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        return start
    }
}