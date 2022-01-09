class Solution {
    func minSwaps(_ data: [Int]) -> Int {
    let totalOnes = data.reduce(0, +)
    
    var currWindowOneCount = 0
    var start = 0
    var end = 0
    var swaps = Int.max
    
    while end < data.count {
        
        currWindowOneCount += data[end]
        end += 1
       
        if end - start > totalOnes {
            currWindowOneCount -= data[start]
            start += 1
        }
        
        swaps = min(swaps, totalOnes - currWindowOneCount)
    }
    
    return swaps
}

}