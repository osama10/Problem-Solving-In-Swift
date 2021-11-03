func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    result.append([])
    
    for num in nums {
        for subset in result {
            result.append(subset + [num])
        }
    }
    
    return result
}

// Time N * 2N
// Space N * 2N
