   /// 300

    func lengthOfLIS(_ nums: [Int]) -> Int {
     var lis = Array(repeating: 1, count: nums.count)

    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] && lis[i] < (lis[j] + 1) {
                lis[i] = lis[j] + 1
            }
        }
    }

    return lis.max() ?? 1
    }