class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        func findPivot() -> Int {
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
            
            return start
        }
        
        func binSearch(_ start: Int, _ end: Int) -> Int {
            var start = start
            var end = end
            
            while start <= end {
                let mid = start + (end - start) / 2
                
                if nums[mid] == target {
                    return mid
                } else if nums[mid] < target {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
            
            return -1
        }
        
        let pivot = findPivot()
        
        if pivot == 0 {
            return binSearch(0, nums.count - 1)
        }
        
        var start = pivot
        var end = nums.count - 1
        
        let ans = binSearch(start , end)
        
        if ans != -1 {
            return ans
        }
        
        start = 0
        end = pivot - 1
        
        return binSearch(start , end)
    }
    
    
}