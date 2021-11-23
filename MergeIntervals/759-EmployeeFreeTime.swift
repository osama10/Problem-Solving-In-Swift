/**
 * Definition for an Interval.
 * public class Interval {
 *     public var start: Int
 *     public var end: Int
 *     public init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
    let schedule = mergeIntervals(schedule.flatMap { $0 }.sorted { $0.start < $1.start })
    var result = [Interval]()
    
    if schedule.count == 1 { return [] }
    
    for i in 0..<schedule.count-1 {
        result.append(Interval(schedule[i].end, schedule[i+1].start))
    }
    
    return result
}

func mergeIntervals(_ schedule: [Interval]) -> [Interval] {
    var prevInterval = schedule[0]
    var result = [Interval]()
    
    for currInterval in schedule[1..<schedule.count] {
        if prevInterval.end >= currInterval.start {
            prevInterval.end = max(prevInterval.end, currInterval.end)
        } else {
            result.append(prevInterval)
            prevInterval = currInterval
        }
    }
    
    result.append(prevInterval)
    return result
}
}