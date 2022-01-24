class Solution1 {
// TLE
    func maxEvents(_ events: [[Int]]) -> Int {
        var events = events
        .sorted { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }
              
        var totalEvents = 0
        var lowestEndTime = 0
        var set = Set<Int>()
       
        for event in events {
            var start = event[0]
            var end = event[1]
            if end < lowestEndTime { continue }
          
            for day in start...end {
                if !set.contains(day) {
                    set.insert(day)
                    lowestEndTime += 1
                    break
                }
            }

            
        }
        
        return set.count
    }
}

// Solved
class Solution2 {
func maxEvents(_ events: [[Int]]) -> Int {

   //sorting events by end times if tie use start time 
    let events = events.sorted {
        if $0[1] == $1[1] {
            return $0[0] < $1[0]
        }
        return $0[1] < $1[1]
    }
    
    var lowest = events.min{$0[0] < $1[0]}![0]
    
    //maintain a set of already used times
    var visited = Set<Int>()
    for event in events {
        if event[1] < lowest {continue}
        
        for i in max(event[0], lowest)...event[1] {
            if !visited.contains(i) {
                visited.insert(i)
                if i == lowest {
                    lowest += 1
                }
                break
            }
        }
    }
    
    return visited.count
}
}