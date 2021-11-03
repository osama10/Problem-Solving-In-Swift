class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var start = 0
        var end = arr.count - 1
        
        while start < end {
            let mid = start + (end - start) / 2
           
            if arr[mid] > arr[mid + 1] {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        return start
    }
}