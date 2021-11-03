func maxLoad(_ intervals: [[Int]]) -> Int {
    var maxLoad = Int.min
    var currLoad = 0
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var endTimes = [(time: Int, load: Int)]()
    endTimes.append((intervals[0][1], intervals[0][2]))
   
    for interval in intervals[1...intervals.count-1] {
        while !endTimes.isEmpty && endTimes[0].time <= interval[0] {
            currLoad -= endTimes[0].load
            endTimes.removeFirst()
        }
        currLoad += interval[2]
        maxLoad = max(currLoad, maxLoad)
        endTimes.append((interval[1], interval[2]))
        endTimes.sort { $0.time < $1.time }
    }
    
    return maxLoad
}
