import UIKit

//665
func checkPossibility(_ nums: [Int]) -> Bool {
    var p: Int? = nil
    for i in 0..<nums.count-1 {
        if nums[i] > nums[i + 1] {
            if p != nil { return false }
            p = i
        }
    }
    guard let index = p else { return true }
    return (index == 0 || index == nums.count - 2 || (nums[index] <= nums[index + 2]  || nums[index-1] <= nums[index + 1]))
}

checkPossibility([3,4,2,3])
checkPossibility([1,5,6,4,5])
