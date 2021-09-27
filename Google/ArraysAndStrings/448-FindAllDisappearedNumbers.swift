class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var nums = nums
        for num in nums {
            let newIndex = abs(num) - 1
            
            if nums[newIndex] > 0 {
                nums[newIndex] = num * -1
            }
        }
        
        for i in 1...nums.count {
            if nums[i - 1] > 0 {
                result.append(i)
            }
        }
       
        return result
    }
    
}