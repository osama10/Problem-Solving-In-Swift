class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let firstIndex = dict[target - num] {
                return [firstIndex, index]
            }
            
            dict[num] = index
        }
        
        
        return []
    }
}