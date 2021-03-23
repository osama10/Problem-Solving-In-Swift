// 665
func checkPossibility(_ nums: [Int]) -> Bool {
    var p: Int? = nil

    for i in 0..<nums.count-1 {
        if nums[i] > nums[i + 1] {
            if let _ = p { return false }
            else { p = i }
        }
    }

    guard let i = p else { return true }
    return i == 0 || i == nums.count - 2 || nums[i - 1] <= nums[i + 1] || nums[i] <= nums[i + 2]
}
