class Solution {
    func subArrayRanges(_ nums: [Int]) -> Int {
        var ans = 0

        for (idx, num1) in nums.enumerated() {
            var maxNum = Int.min
            var minNum = Int.max
            
            minNum = min(num1, minNum)
            maxNum = max(num1, maxNum)

            for num2 in nums[idx+1..<nums.count] {
                minNum = min(num2, minNum)
                maxNum = max(num2, maxNum)
                ans += maxNum - minNum
            }
        }

        return ans
    }
}
