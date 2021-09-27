/*
 The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

 F(0) = 0, F(1) = 1
 F(n) = F(n - 1) + F(n - 2), for n > 1.
 
 Given n, calculate F(n).
 */

func fib(_ n: Int) -> Int {
    guard n > 1 else { return n }
    var fibNumber = Array(repeating: 0, count: n + 1)
    fibNumber[1] = 1
    
    for state in 2...n {
        fibNumber[state] = fibNumber[state - 1] + fibNumber[state - 2]
    }
    
    return fibNumber[n]
    
}

fib(4)