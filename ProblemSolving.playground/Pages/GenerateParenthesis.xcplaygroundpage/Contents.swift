import Foundation

/// 22
// O((4^n)/sqrt(n)
func generateParethesis (n:Int) ->[String] {
    if n == 0 { return [] }
    var allCombinations = [String]()
    backTracking(&allCombinations, "", 0, 0, max: n)
    return allCombinations
}


func backTracking(_ allCombinations: inout [String], _ combination: String, _ open: Int, _ close: Int, max: Int) {
    if 2 * max  == combination.count { allCombinations.append(combination) }
    else {
        if open < max {
            backTracking(&allCombinations, combination + "(", open + 1, close, max: max)
        }
        if close < open {
            backTracking(&allCombinations, combination + ")", open , close + 1, max: max)
        }
    }
}

generateParethesis(n: 1)


