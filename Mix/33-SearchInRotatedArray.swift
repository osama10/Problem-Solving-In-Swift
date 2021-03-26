func findPivot(_ nums: [Int], _ lo: Int, _ hi: Int) -> Int {
    var lo = lo
    var hi = hi

    while lo < hi {
        let mid = (lo + hi) / 2
        if nums[mid] > nums[hi] {
            lo = mid + 1
        } else {
            hi = mid 
        }
    }

    return lo
}

func binSearch(_ nums: [Int], _ lo: Int, _ hi: Int, _ target: Int) -> Int {
    var lo = lo
    var hi = hi

    while lo <= hi {
        let mid = (lo + hi) / 2
        if nums[mid] == target { return mid }
        else if nums[mid] < target { lo = mid + 1 }
        else { hi = mid - 1 }
    }

    return -1
}

func search(_ nums: [Int], _ target: Int) -> Int {
    let hi = nums.count - 1
    let lo = 0

    let pivot = findPivot(nums, lo, hi)

    if nums[pivot] <= target && target <= nums[hi] {
        return binSearch(nums, pivot, hi, target)
    }

    return binSearch(nums, lo, pivot - 1, target)
}