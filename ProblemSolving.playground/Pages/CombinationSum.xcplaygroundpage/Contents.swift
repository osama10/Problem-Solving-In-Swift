import Foundation

/// 39
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var combination = [Int]()
    var allCombinations = [[Int]]()
    backtrack(candidates, target, 0, &allCombinations, combination: &combination, sum: 0)
    return allCombinations
}


func backtrack(_ candidates: [Int], _ target: Int, _ start: Int, _ allCombinations: inout [[Int]], combination: inout [Int], sum: Int) {
    if sum == target {
        allCombinations.append(combination)
        return
    }

    if sum > target { return }

    for index in start..<candidates.count {
        combination.append(candidates[index])
        backtrack(candidates, target, index, &allCombinations, combination: &combination, sum: sum + candidates[index])
        combination.removeLast()
    }
}

combinationSum([2,3,5], 5)
combinationSum([1,2,1], 3)

