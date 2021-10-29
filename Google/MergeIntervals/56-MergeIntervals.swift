class Solution {
   func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else { return intervals }
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var mergedIntervals = [[Int]]()
    var prevInterval = intervals[0]
    
    for interval in intervals[1...intervals.count-1] {
        if prevInterval[1] >= interval[0] {
            prevInterval[1] = max(interval[1], prevInterval[1])
        } else {
            mergedIntervals.append(prevInterval)
            prevInterval = interval
        }
    }
    
    mergedIntervals.append(prevInterval)
       
    return mergedIntervals
}

}