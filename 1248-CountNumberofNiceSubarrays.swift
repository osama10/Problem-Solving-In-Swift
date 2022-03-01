class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var prefixCount = Array(repeating: 0, count: nums.count)
        var oddCount = 0
        
        for num in nums {
            prefixCount[oddCount] += 1
            
            if num % 2 == 1 {
                oddCount += 1
            }
            
            if oddCount >= k {
                count += prefixCount[oddCount - k]
            }
        }
        
        return count
    }
}