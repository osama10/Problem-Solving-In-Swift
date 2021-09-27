func permute(_ nums: [Int]) -> [[Int]]{
    var visited = Set<Int>()
    var currePer = [Int]()
    var result = [[Int]]()
    permuteThroughDFS(nums, &visited, &currePer, &result)
    return result
}

func permuteThroughDFS(_ nums: [Int], _ visisted: inout Set<Int>, _ currPer: inout [Int], _ all: inout [[Int]]) {
    
    if currPer.count == nums.count {
        all.append(currPer)
        return
    }
    
    for num in nums {
        if !visisted.contains(num) {
            currPer.append(num)
            visisted.insert(num)
            permuteThroughDFS(nums, &visisted, &currPer, &all)
            currPer.removeLast()
            visisted.remove(num)
        }
    }
}