class Solution {
 func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var intervals = intervals
    var newIntervalInserted = false
    
    for (index, interval) in intervals.enumerated() {
        if interval[0] > newInterval[0] {
            intervals.insert(newInterval, at: index)
            newIntervalInserted = true
            break
        }
    }
        
    if !newIntervalInserted {
        intervals.append(newInterval)
    }

    return merge(intervals)
}


func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else { return intervals }

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