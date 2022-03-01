class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
         atMostKOdd(nums, k) - atMostKOdd(nums, k - 1)
    }
    
    func atMostKOdd(_ nums: [Int], _ k: Int) -> Int {
        var start = 0
        var length = 0
        var oddCount = 0
        
        for (end, num) in nums.enumerated() {
            
            if num % 2 == 1 {
                oddCount += 1
            }
            
            while oddCount > k  {
                if nums[start] % 2 == 1 {
                    oddCount -= 1
                }
               
                start += 1
            }
            
            length += (end - start) + 1
        }
        
        return length
    }
}