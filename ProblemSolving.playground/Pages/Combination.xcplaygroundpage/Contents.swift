import Foundation
// 77
func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var result: [[Int]] = []
    var combination:  [Int] = []
    for num in 1...n {
        backtrack(n, k, num: num, combination: &combination, result: &result)

    }
    return result
}


func backtrack(_ n: Int, _ k : Int, num: Int, combination: inout [Int], result: inout [[Int]]) {
    combination.append(num)
    if combination.count == k {
        result.append(combination)
    } else {
        if num + 1 <= n {
            for next in num+1...n {
                backtrack(n, k, num: next, combination: &combination, result: &result)
            }
        }

    }

    combination.removeLast()
}

combine(4, 2)
