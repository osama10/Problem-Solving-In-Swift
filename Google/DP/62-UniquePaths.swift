func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: n), count: m)
    return calUniquePaths(m - 1, n - 1, &memo)
}

func calUniquePaths(_ m: Int, _ n : Int, _ memo: inout [[Int]]) -> Int {
    if m == 0 && n == 0 {
        return 1
    }
    
    if m < 0 || n < 0 { return 0 }
    
    if memo[m][n] == -1 {
        memo[m][n] = calUniquePaths(m, n - 1, &memo) + calUniquePaths(m - 1, n, &memo)
    }
    
    return memo[m][n]
}

uniquePaths(3, 2)
