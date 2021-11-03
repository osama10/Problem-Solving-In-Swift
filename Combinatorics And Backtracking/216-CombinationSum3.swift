class Solution {
func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var comb = [Int]()
    var allComb = [[Int]]()
    calCombination(k, n, 1, &comb, &allComb)
    return allComb
}

func calCombination(_ k: Int,
                    _ target: Int,
                    _ start: Int,
                    _ comb: inout [Int],
                    _ allCombination: inout [[Int]]) {
    
    if k == comb.count && target == 0 {
        allCombination.append(comb)
        return
    }
    
    if target < 0 || k == comb.count {
        return
    }
   
    if start < 10 {
        for num in start...9 {
            comb.append(num)
            calCombination(k, target - num, num + 1, &comb, &allCombination)
            comb.removeLast()
        }
    }
    
}

}
