class MyCalendarThree {
    var startTimes = [Int]()
    var endTimes = [Int]()
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Int {
        return numberOfMeetings(start, end)
    }
    
    func numberOfMeetings(_ start: Int, _ end:Int) -> Int {
        
        var overlappingMeetings = 0
        var startPtr = 0
        var endPtr = 0
        var maxOverlappings = 0
        
        startTimes.append(start)
        endTimes.append(end)
        
        startTimes.sort()
        endTimes.sort()
        while startPtr < startTimes.count {
            
            if startTimes[startPtr] >= endTimes[endPtr] {
                overlappingMeetings -= 1
                endPtr += 1
            }
            
            overlappingMeetings += 1
            startPtr += 1
            
            maxOverlappings = max(maxOverlappings, overlappingMeetings)
            
        }
        
        return maxOverlappings
        
    }
    
}

/**
 * Your MyCalendarThree object will be instantiated and called as such:
 * let obj = MyCalendarThree()
 * let ret_1: Int = obj.book(start, end)
 */