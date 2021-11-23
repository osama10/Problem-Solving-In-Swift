class Solution {
  func findShortestSubArray(_ nums: [Int]) -> Int {
    var left = [Int: Int]()
    var right = [Int: Int]()
    var count = [Int: Int]()
    var degree = 0
    var length = Int.max
    
    for (index, num) in nums.enumerated() {
        if left[num] == nil {
            left[num] = index
        }
        right[num] = index
        count[num, default: 0] += 1
        degree = max(degree, count[num, default: 0])
    }
    
    for num in nums {
        if count[num, default: 0] == degree {
            length = min(length, right[num, default: 0] - left[num, default: 0] + 1)
        }
    }
    
    return length
}
}