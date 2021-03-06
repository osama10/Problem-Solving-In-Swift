
import Foundation

/// 1437
func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {

    var lastIndex = -1

    for i in 0..<nums.count {
        if nums[i] == 1 {
            if lastIndex == -1 {  lastIndex = i }
            else {
                if (i - lastIndex - 1) < k { return false }
                lastIndex = i
            }
        }
    }

    return true
}


kLengthApart([1,0,0,0,1,0,0,1,0], 2)
