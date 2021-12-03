class Solution {
    typealias LargestNum = (first: Int, second:Int, third: Int)
    
    func thirdMax(_ nums: [Int]) -> Int {
        var largestNum: LargestNum = (Int.min, Int.min, Int.min)
        let uniqueNums = Set(nums)
        
        for num in uniqueNums {
            if num > largestNum.first {
                largestNum = (num, largestNum.first, largestNum.second)
            } else if num > largestNum.second {
                 largestNum = (largestNum.first, num, largestNum.second)
            } else if num > largestNum.third {
                 largestNum = (largestNum.first, largestNum.second, num)
            }
        }
        
        return largestNum.third == Int.min ? largestNum.first : largestNum.third
    }
    
}