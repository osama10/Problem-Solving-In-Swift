 func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        var count = 0
        var currPrefixSum = 0
        
        nums.forEach { num in
            currPrefixSum += num
            if currPrefixSum == k {
                count += 1
            }
            
            count += dict[currPrefixSum - k , default: 0]
            dict[currPrefixSum] = dict[currPrefixSum, default: 0] + 1
        }
        
        return count
}