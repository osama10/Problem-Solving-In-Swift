class Solution {
    func findMin(_ nums: [Int]) -> Int {
         var start = 0
            var end = nums.count - 1
            
            while start < end {
                let mid = start + (end - start) / 2
                if nums[mid] > nums[end] {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
            
            return nums[start]
    }
}