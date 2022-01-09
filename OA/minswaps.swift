func minSwaps(_ data: [Int]) -> Int {
    let totalOnes = data.reduce(0, +)
    
    var currWindowOneCount = 0
    var start = 0
    var end = 0
    var swaps = Int.max
    
    while end < data.count {
        currWindowOneCount += data[start]
        end += 1
        if end - start > totalOnes {
            currWindowOneCount -= data[end]
            start += 1
        }
        
        swaps = min(swaps, currWindowOneCount)
    }
    
    return swaps
}


func minimumSwaps(_ data: [Int]) -> Int {
    var countOfZero = 0 , swapForZero = 0, countOfOne = 0, swapForOne = 0
    
    for num in data {
        if num == 0 {
            swapForZero += countOfOne
            countOfZero += 1
        } else {
            swapForOne += countOfZero
            countOfOne += 1
        }
    }
    
    return min(swapForOne, swapForZero)
}