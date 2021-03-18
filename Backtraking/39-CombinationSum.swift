// 39

func backtrack( _ index: Int, _ sum: inout Int, _ combination: inout [Int], _ allCombinations: inout[[Int]],_ candidates: [Int], _ targetSum: Int) {

    if sum == targetSum {
        allCombinations.append(combination)
        return
    }

    if sum > targetSum { return }

    for nextIndex in index..<candidates.count {
        combination.append(candidates[nextIndex])
        sum += candidates[nextIndex]
        backtrack(nextIndex, &sum, &combination, &allCombinations, candidates, targetSum)
        sum -= candidates[nextIndex]
        combination.removeLast()
    }

}

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var allCombinations: [[Int]] = []
    var combination: [Int] = []
    var sum  = 0
    backtrack(0, &sum, &combination, &allCombinations, candidates, target)
    return allCombinations
}