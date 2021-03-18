//: [Previous](@previous)

import Foundation

/// 151

func reverseWords(_ s: String) -> String {
    s
    .split(separator: " ")
    .reversed()
    .joined(separator: " ")
}

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 { return [] }
    var result = [[Int]]()
    let nums = nums.sorted()

    func twoSum(_ low: Int, _ high: Int, _ k : Int ) {
        var low = low
        var high = high

        while low <  high{
            let sum = nums[low] + nums[high]
            if sum == k {
                result.append([-k, nums[low] , nums[high]])
                low += 1
                high -= 1
                while low < high && nums[low] == nums[low - 1] { low += 1 }
                while low < high && nums[high] == nums[high + 1] { high -= 1 }
            }
            else if sum > k { high -= 1 }
            else { low += 1 }

        }
    }

    for i  in 0..<nums.count-2 {
        if i > 0 && nums[i - 1] == nums[i] { continue }
        twoSum(i + 1, nums.count - 1, -nums[i])
    }

    return result
}

func romanMapper(char: Character) -> Int {

switch char {
case "I":
    return 1
case "V":
    return 5
case "X":
    return 10
case "L":
    return 50
case "C":
    return 100
case "D":
    return 500
case "M":
    return 1000
default:
    return -1 // return error case
}
}
func romanToInt(_ s: String) -> Int {
    let romanNumber = Array(s)
    var index = 0
    var result = 0

    while index < romanNumber.count {
        let currentNum = romanMapper(char: romanNumber[index])

        if (index < romanNumber.count - 1) {
            let nextNumber = romanMapper(char: romanNumber[index + 1])
            result += currentNum < nextNumber ? -currentNum : currentNum
        } else {
            result += currentNum
        }

        index += 1
    }

    return result
}


romanToInt(<#T##s: String##String#>)
