import UIKit

//665

func checkPossibility(_ nums: [Int]) -> Bool {
    var defectedIndex = -1

    for index in 0..<nums.count - 1 {
        if nums[index] > nums[index + 1] {
            if defectedIndex == -1 { defectedIndex = index}
            else { return false }
        }
    }

    return (defectedIndex == -1 || defectedIndex == 0 || defectedIndex == nums.count - 2 || (nums[defectedIndex] <= nums[defectedIndex + 2]) || (nums[defectedIndex - 1] <= nums[defectedIndex + 1]) )
}

checkPossibility([3,4,2,3])
checkPossibility([1,5,6,4,5])


