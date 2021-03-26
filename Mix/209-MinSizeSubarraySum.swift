// 209 
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var minLength = Int.max
    var start = 0
    var currentSum = 0

    for i in 0..<nums.count {
        currentSum += nums[i]
        while currentSum >= target {
            minLength = min(minLength, (i - start + 1))
            currentSum -= nums[start]
            start += 1
        }
    }

    return minLength == Int.max ? 0 : minLength
}