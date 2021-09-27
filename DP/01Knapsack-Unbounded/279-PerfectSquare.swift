func numSquares(_ n: Int) -> Int {
    var dp = Array(repeating: Int.max, count: n + 1)
    let maxPossibileSquareIndex = Int(sqrt(Double(n))) + 1
    let possibileSquares = (0..<maxPossibileSquareIndex).map { $0 * $0 }
    
    dp[0] = 0
   
    for num in 1...n {
        for squareIndex in 1..<maxPossibileSquareIndex {
            let validSquare = possibileSquares[squareIndex]
            if num < validSquare {
                break
            }
            
            dp[num] = min(dp[num], dp[num - validSquare] + 1)
        }
    }


    return dp[n]
}