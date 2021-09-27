func countMinJump(_ jumps: [Int]) -> Int {
    var memo = Array(repeating: -1, count: jumps.count)
    return countMinJumpsRecursive(jumps, 0, &memo)
}

func countMinJumpsRecursive(_ jumps: [Int], _ currentPos: Int, _ memo: inout [Int]) -> Int {
    
    if currentPos == jumps.count - 1 {
        return 0
    }
    
    if jumps[currentPos] == 0 {
        return Int.max
    }
    
   
    if memo[currentPos] == -1 {
       
        var start = currentPos + 1
        let end = currentPos + jumps[currentPos]
        var totalMinJumps = Int.max
        
        while  start < jumps.count && start <= end {
            
            let partialMinJump = countMinJumpsRecursive(jumps, start, &memo)
           
            if partialMinJump != Int.max {
                totalMinJumps = min(partialMinJump + 1, totalMinJumps)
            }
            
            start += 1
        }
        
        memo[currentPos] = totalMinJumps
    }
    
    return memo[currentPos]
}

countMinJump([2,1,1,1,4])
countMinJump([1,1,3,6,9,3,0,1,3])
