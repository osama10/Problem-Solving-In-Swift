import Foundation

func missingNumber(_ nums: [Int]) -> Int {
    let givenSum = nums.reduce(0, +)
    let actualSum = (0...nums.count).reduce(0,+)
    return actualSum - givenSum
}

//func missingNumber(_ nums: [Int]) -> Int {
//
//       var result = nums.count
//       for i in 0..<nums.count{
//           result ^= i ^ nums[i]
//
//       }
//       return result
//   }

missingNumber([0])
