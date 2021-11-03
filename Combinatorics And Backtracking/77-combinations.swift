func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var allCombination = [[Int]]()
    var combination = [Int]()
    genComb(k, n, 0, &combination, &allCombination)
    return allCombination
}


func genComb(_ k: Int,
          _ n: Int,
          _ start: Int,
          _ comb: inout [Int],
          _ allCombination: inout [[Int]]) {
    if k == comb.count {
        allCombination.append(comb)
        return
    }
    
    if k < comb.count { return }
    
    if start < n {
        for next in start..<n {
            comb.append(next + 1)
            genComb(k, n, next + 1, &comb, &allCombination)
            comb.removeLast()
        }
    }
}
