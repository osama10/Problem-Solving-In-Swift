class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        
        var start = 0
        var currentProduct = 1
        var count = 0
        
        for (end,value) in nums.enumerated() {
            
            if value >= k {
                start = end + 1
                currentProduct = 1 
                continue
            }
            
            currentProduct *= value
            
            while currentProduct >= k {
                currentProduct = currentProduct / nums[start]
                start += 1
            }
            
           count += end - start + 1
            
        }
        
        return count
    }
}
