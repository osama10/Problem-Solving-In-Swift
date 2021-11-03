    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var comb = [Int]()
        var all = [[Int]]()
        calCombinationSum(candidates, 0, target, 0, &comb, &all)
        return all
    }
    
    func calCombinationSum(_ candidates: [Int], _ start: Int,_ target: Int, _ sum: Int, _ comb: inout[Int], _ all: inout [[Int]]) {
        if target < sum {
            return
        }
        
        if target == sum {
            all.append(comb)
            return
        } 
        
        for next in start...candidates.count-1 {
            comb.append(candidates[next])
            calCombinationSum(candidates, next, target, sum + candidates[next], &comb, &all )
            comb.removeLast()
        }
}