class Solution {
    var memo = [Int: Int]()
    
    func jump(_ nums: [Int]) -> Int {
        minJumps(nums, 0)
    }
    
    func minJumps(_ nums: [Int], _ curr: Int) -> Int {
       
        if curr >= nums.count - 1 {
            return 0
        }
        
        if nums[curr] == 0 {
            return Int.max
        }
        
        if let totalJumps = memo[curr] {
            return totalJumps
        }
        
        var totalJumps = Int.max
        
        for jump in 1...nums[curr] {
            let tempJump = minJumps(nums, curr + jump) 
            if tempJump != Int.max {
                totalJumps = min(totalJumps, tempJump + 1)
            }
        }
        
        memo[curr] = totalJumps
        
        return totalJumps
        
    }
}