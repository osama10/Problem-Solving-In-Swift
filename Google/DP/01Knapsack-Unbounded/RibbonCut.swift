
func maxRibbonCut(_ ribbonLength: [Int], _ totalLength: Int) -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: totalLength + 1), count: ribbonLength.count + 1)
    let totalWays = calculateMaxRibbonCut(ribbonLength, totalLength, ribbonLength.count, &memo)
    return totalWays == Int.min ? -1 : totalWays
}

func calculateMaxRibbonCut(_ ribbonLength: [Int],
                           _ totalLength: Int,
                           _ n: Int,
                           _ memo: inout [[Int]]) -> Int {
    
    if totalLength == 0 {
        return 0
    }
    
    if n == 0 {
        return Int.min
    }
    
    if memo[n][totalLength] == -1 {
        var totalCutsWithN = Int.min
        
        if ribbonLength[n - 1] <= totalLength {
            let tempCuts = calculateMaxRibbonCut(ribbonLength, totalLength - ribbonLength[n - 1], n, &memo)
            
            if tempCuts != Int.min {
                totalCutsWithN = tempCuts + 1
            }
        }
        
        let totalCutsWithoutN = calculateMaxRibbonCut(ribbonLength, totalLength, n - 1, &memo)
        
        memo[n][totalLength] = max(totalCutsWithN, totalCutsWithoutN)
    }
    
    return memo[n][totalLength]
}


print(maxRibbonCut([2,3,5], 5)) // 2
print(maxRibbonCut([2,3], 7)) // 3
print(maxRibbonCut([3,5,7], 13)) // 3
print(maxRibbonCut([3,5], 7)) // -1
print(maxRibbonCut([232, 124, 456], 7))