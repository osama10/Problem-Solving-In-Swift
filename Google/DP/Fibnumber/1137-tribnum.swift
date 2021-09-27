/*
 The Tribonacci sequence Tn is defined as follows:

 T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.

 Given n, return the value of Tn.
 */

func tribonacci(_ n: Int) -> Int {
    guard n > 2 else { return n == 0 ? 0 : 1 }
    var tribNumber = Array(repeating: 0, count: n + 1)
    tribNumber[1] = 1
    tribNumber[2] = 1
    
    for state in 3...n {
        tribNumber[state] = tribNumber[state - 1] + tribNumber[state - 2] + tribNumber[state - 3]
    }
    
    return tribNumber[n]
}
