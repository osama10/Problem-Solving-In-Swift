func climbStairs(_ n: Int) -> Int {
    var memo = [Int:Int]()
    return numberOfWays(n, &memo)
}

func numberOfWays(_ n: Int, _ memo: inout [Int: Int]) ->Int{
     if n == 1 { return 1 }
     else if n == 2 { return 2 }
    else if memo[n] != nil {
        return memo[n]!
    }

    memo[n] = numberOfWays(n - 1, &memo) + numberOfWays( n - 2, &memo)
    return memo[n]!

}