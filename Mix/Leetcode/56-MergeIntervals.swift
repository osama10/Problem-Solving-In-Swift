/// 56
func merge(_ intervals: [[Int]]) -> [[Int]] {

    if intervals.isEmpty { return [] }

    let intervals = intervals.sorted{ $0[0] < $1[0] }
    var currentInterval = intervals[0]
    var mergedIntervals = [[Int]]()

    for interval in intervals[1..<intervals.count] {
        if currentInterval[1] >= interval[0] {
            currentInterval[1] = max(currentInterval[1], interval[1])
        } else {
            mergedIntervals.append(currentInterval)
            currentInterval = interval
        }
    }
    mergedIntervals.append(currentInterval)

    return mergedIntervals
}


merge([[1,3],[2,6],[8,10],[15,18]])
merge([[1,4],[4,5]])
merge([[1,4]])
merge([[1,4],[2,3]])