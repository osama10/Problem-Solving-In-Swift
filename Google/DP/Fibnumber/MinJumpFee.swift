func minJumpFee(_ fee: [Int]) -> Int {
    var memo = Array(repeating: -1, count: fee.count + 1)
    return calMinJumps(fee, fee.count, &memo)
}

func calMinJumps(_ fee: [Int], _ stair: Int, _ memo: inout [Int]) -> Int {
    if stair < 1 {
        return 0
    }
    
    if stair == 1 || stair == 2 {
        return fee[0]
    }

    
    if memo[stair] == -1 {
        let feeOfOneJump = calMinJumps(fee, stair - 1, &memo) + fee[stair - 1]
        let feeOfTwoJump = calMinJumps(fee, stair - 2, &memo) + fee[stair - 2]
        let feeOfThreeJump = calMinJumps(fee, stair - 3, &memo) + fee[stair - 3]
        
        memo[stair] = min(feeOfOneJump, feeOfTwoJump, feeOfThreeJump)

    }
    
    return memo[stair]
}
