class Solution {
  func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
    var sortedfreqTable = arr
        .reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1}
        .sorted { $0.value < $1.value }
    
    var k = k
    
    for (index,value) in sortedfreqTable.enumerated() {
        k -= value.value
        sortedfreqTable[index] =  k >= 0 ? (value.key, 0) : (value.key, abs(k))
        if k <= 0 { break }
    }
    
    return sortedfreqTable.filter { $0.value > 0 }.count
    
}
}

