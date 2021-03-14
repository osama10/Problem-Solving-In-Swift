import Foundation

/// 125
//func isPalindrome(_ s: String) -> Bool {
//    if s.isEmpty { return true }
//    let alphaNumericString = s
//        .components(separatedBy: CharacterSet.alphanumerics.inverted)
//        .joined()
//        .lowercased()
//    return alphaNumericString.isEmpty || (alphaNumericString == String(alphaNumericString.reversed()))
//}

func isPalindrome(_ s: String) -> Bool {
    if s.isEmpty { return true }
    let s = Array(s.lowercased())
    var start = 0
    var end = s.count - 1

    while start < end {
        if !(s[start].isNumber || s[start].isLetter) {
            start += 1
        } else if !(s[end].isNumber || s[end].isLetter) {
            end -= 1
        } else if s[start] == s[end] {
            start += 1
            end -= 1
        } else {
            return false
        }
    }

    return true
}

isPalindrome("")

var dict = [Int:Int]()

func threeSum(_ nums: [Int]) -> [[Int]] {

    if nums.count < 3 { return [] }
    let nums = nums.sorted()
    var result = [[Int]]()

    func twoSum(_ lo: Int, _ hi: Int, k: Int) {
        var lo = lo
        var hi = hi

        while lo < hi {
            let sum = nums[lo] + nums[hi]
            if sum == k {
                result.append([-k, nums[lo], nums[hi]])
                lo += 1
                hi -= 1
                while lo < hi && nums[lo - 1] == nums[lo] { lo += 1 }
                while lo < hi &&  nums[hi + 1] == nums[hi] { hi -= 1 }
            } else if sum > k { hi -= 1 }
            else { lo += 1}
        }
    }

    for i in 0..<nums.count - 2 {
        if i > 0 && nums[i] == nums[i - 1] { continue }
        twoSum(i + 1, nums.count - 1, k:  -nums[i])
    }

    return result
}

threeSum([-1,0,1,2,-1,-4])
