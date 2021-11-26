class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        if nums.count == 1 { 
            return false
        }
        
        var prefixSum = nums[0]
        
        var start = 0
        var dict = [ nums[0] % k: 0] 
        
        for i in 1..<nums.count {
            prefixSum += nums[i]
            let remainder = prefixSum % k
            
            if remainder == 0 {
                return true
            } else if let secondIndex = dict[remainder] {
                if abs(i - secondIndex) >= 2 { return true }
            } else {
                dict[remainder] = i
            }   
        }
		
        return false
    }
}
