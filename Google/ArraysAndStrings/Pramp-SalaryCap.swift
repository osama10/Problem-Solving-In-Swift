func findGrantsCap(grantsArray: [Double], newBudget: Double) -> Double {
    guard !grantsArray.isEmpty else { return 0.0 }
    if grantsArray.count == 1 { return newBudget }
    
    let grantsArray = grantsArray.sorted()
    var salaryCap = newBudget/Double(grantsArray.count)
    
    for (index, salary) in grantsArray.enumerated() {
        if salary <= salaryCap {
            let allocatedCap = salaryCap - salary
            let remainingCandidates = grantsArray.count - 1 - index
            salaryCap += allocatedCap / Double(remainingCandidates)
        }
    }
    
    return salaryCap
    
}

/**
- start with a cap that is the max possible amount equally distributed to every individual
- sort the array in ascending order
- then for each salary
    - if salary is less than equal to cap then we dont need it
    - So we remove it from the cap to get extra amount
    - this amount will then be divided to all others and added to the cap 
*/
