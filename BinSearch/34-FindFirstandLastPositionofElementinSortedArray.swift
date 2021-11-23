class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty { return [-1, -1] }
        
        func binSearch(_ findMax: Bool) -> Int {
            var left = 0
            var right = nums.count - 1 
            var keyIndex = -1
           
            while left <= right {
                let mid = left + (right - left) / 2
                
                if nums[mid] < target {
                    left = mid + 1
                }  else if nums[mid] > target {
                    right = mid - 1
                } else {
                    keyIndex = mid
                    if findMax {
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
            }
            
            return keyIndex
        }
        
        var result = [Int]()
        
        result.append(binSearch(false))
        
        if result[0] == -1 {
            return [-1, -1]
        }
        
        result.append(binSearch(true))
        
        return result
    }
    
}
