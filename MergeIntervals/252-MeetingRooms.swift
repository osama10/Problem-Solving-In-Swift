class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    guard intervals.count > 1 else { return true }
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var currInterval = intervals[0]
    
    for interval in intervals[1...intervals.count-1] {
        if interval[0] < currInterval[1] {
            return false
        } else {
            currInterval = interval
        }
    }
    
    return true
}

}