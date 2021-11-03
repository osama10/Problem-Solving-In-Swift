func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    guard intervals.count > 1 else { return intervals.count }
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var endTimes = [Int]()
    
    for interval in intervals {
        if !endTimes.isEmpty, endTimes[0] <= interval[0] {
            endTimes.removeFirst()
        }
        endTimes.append(interval[1])
        endTimes.sort( by: < )
    }

    return endTimes.count
}
