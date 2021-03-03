import Foundation

func backTrack(_ start: Int, _ combination: inout [Int], _ allCombinations: inout[[Int]], _ k: Int, _ n: Int) {
    if combination.count == k {
        allCombinations.append(combination)
        return
    }

    if start > n { return }

    for number in start...n {
        combination.append(number)
        backTrack(number + 1, &combination, &allCombinations, k, n)
        combination.removeLast()
    }
}

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var allCombinations: [[Int]] = []
    var combination:  [Int] = []
    backTrack(1, &combination, &allCombinations, k, n)
    return allCombinations
}


combine(4, 4)
