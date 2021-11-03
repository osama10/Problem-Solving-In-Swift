class Solution {
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var visited = Array(repeating: false, count: nums.count)
    var currePer = [Int]()
    var result = [[Int]]()
    permuteThroughDFS(nums.sorted(), &visited, &currePer, &result)
    return result
}

func permuteThroughDFS(_ nums: [Int], _ visisted: inout [Bool], _ currPer: inout [Int], _ all: inout [[Int]]) {
    
    if currPer.count == nums.count {
        all.append(currPer)
        return
    }
    
    for i in 0..<nums.count {
  
    
        if visisted[i]
            || (i > 0
                    && nums[i - 1] == nums[i]
                    && visisted[i - 1]) {
            continue
        }

        currPer.append(nums[i])
        visisted[i] = true
        permuteThroughDFS(nums, &visisted, &currPer, &all)
        currPer.removeLast()
        visisted[i] = false
    }
}


}