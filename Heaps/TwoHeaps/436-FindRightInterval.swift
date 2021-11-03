class Solution {
func findRightInterval(_ intervals: [[Int]]) -> [Int] {
    var maxEnd = intervals
        .enumerated()
        .map { (end: $0.element[1], i: $0.offset) }
        .sorted { $0.end < $1.end }
        
    var maxStart = intervals
        .enumerated()
        .map { (start: $0.element[0], i: $0.offset) }
        .sorted { $0.start < $1.start }
        
    var result = Array(repeating: -1, count: intervals.count)
    
    for _ in 0..<intervals.count {
        let (maxEndTime, i) = maxEnd.removeLast()
        
        if var maxStartTime = maxStart.last,
           maxStartTime.start >= maxEndTime {
            maxStartTime = maxStart.removeLast()
            while !maxStart.isEmpty && maxStart.last!.start >= maxEndTime {
                maxStartTime = maxStart.removeLast()
            }
            result[i] = maxStartTime.i
            maxStart.append(maxStartTime)
        }

    }
    
    return result
}

}