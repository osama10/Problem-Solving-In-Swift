// 673
func findNumberOfLIS(_ nums: [Int]) -> Int {

    var lis = Array(repeating: 1, count: nums.count)

    var count = Array(repeating: 1, count: nums.count)

    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] && lis[i] < lis[j] + 1 {
                lis[i] = lis[j] + 1
                count[i] = count[j]
            }else if lis[i] == lis[j] + 1 {
                count[i] += count[j]
            }
        }
    }

    var ans = 0
    let longestLength = lis.max() ?? 1
    for i in 0..<lis.count {
        if lis[i] == longestLength  { ans += count[i] }
    }

    return ans
}