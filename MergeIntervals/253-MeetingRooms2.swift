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


class Solution2 {
func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    guard intervals.count > 1 else { return intervals.count }
    
    let startTimes = intervals.map { $0[0] }.sorted()
    let endTimes = intervals.map { $0[1] }.sorted()
    
    var startIndex = 0
    var endIndex = 0
    
    var rooms = 0
    
    while startIndex < startTimes.count {
        if startTimes[startIndex] >= endTimes[endIndex] {
            rooms -= 1
            endIndex += 1
        }
        
        rooms += 1
        startIndex += 1
    }

    return rooms
}
    
}
