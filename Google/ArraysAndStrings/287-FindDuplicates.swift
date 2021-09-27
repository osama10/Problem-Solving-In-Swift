class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var lo = 1
        var hi = nums.count - 1
        var duplicates = -1
        
        while lo <= hi {
            var count = 0
            
            var curr = ( lo + hi ) / 2
            
            for num in nums {
                if num <= curr {
                    count += 1
                }
            }
            
            if count > curr {
                duplicates = curr
                hi = curr - 1
            } else {
                lo = curr + 1
            }
        }
        
        return duplicates
    }
}

