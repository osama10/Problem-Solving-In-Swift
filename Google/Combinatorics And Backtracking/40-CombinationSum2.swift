func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var comb = [Int]()
    var all = [[Int]]()
    var visited = Array(repeating: false, count: candidates.count)
    calCombinationSum(candidates.sorted(), 0, target, 0, &comb, &all, &visited)
    return all
}

func calCombinationSum(_ candidates: [Int], _ start: Int,_ target: Int, _ sum: Int, _ comb: inout[Int], _ all: inout [[Int]], _ visited: inout [Bool]) {
    
     if target < sum {
        return
    }
    
    if target == sum {
        all.append(comb)
        return
    }

    if start >= candidates.count { return }
    var set = Set<Int>()
    
    for current in start...candidates.count-1 {
        if current > 0 && candidates[current - 1] == candidates[current] && set.contains(current - 1){
            continue
            
        }
        set.insert(current)
        comb.append(candidates[current])
        calCombinationSum(candidates, current + 1, target, sum + candidates[current], &comb, &all, &visited)
        comb.removeLast()
    }
}


combinationSum2([2, 2, 2], 2)
       
