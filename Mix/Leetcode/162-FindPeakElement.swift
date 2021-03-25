// 162 
func findPeakElement(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }
    return peakFinder(nums: nums, hi: nums.count - 1, lo: 0)
}

func peakFinder(nums: [Int], hi: Int, lo: Int) -> Int {
    let mid = (lo + (hi - lo)/2)
    if (mid == 0 || nums[mid - 1] <= nums[mid]) && (mid == (nums.count - 1) || nums[mid + 1] <= nums[mid] ){ return mid }
    return (mid > 0 && nums[mid - 1] >= nums[mid]) ?
        peakFinder(nums: nums, hi: mid - 1, lo: lo) :
        peakFinder(nums: nums, hi: hi, lo: mid + 1)
}