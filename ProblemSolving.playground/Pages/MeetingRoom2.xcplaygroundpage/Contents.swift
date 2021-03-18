import Foundation
/// 253      https://github.com/Seanforfun/Algorithm-and-Leetcode/blob/master/leetcode/253.%20Meeting%20Rooms%20II.md


/// with PQUE
func minMeetingRoom(_ intervals: [[Int]]) -> Int {

    var intervals = intervals
    var rooms = 0
    var pQueue = Heap<Int>(sort: < )

    intervals.sort { $0[0] < $1[0] }

    intervals.forEach { interval in
        pQueue.insert(interval[1])
        if interval[0] < pQueue.peek()! { rooms += 1 }
        else { pQueue.remove() }
    }

    return rooms
}



minMeetingRoom([[0, 30],[5, 10],[15, 20]])
minMeetingRoom([[0, 1],[2, 3],[4, 5]])
minMeetingRoom([[0, 60],[20, 30],[18, 25]])
minMeetingRoom([])
