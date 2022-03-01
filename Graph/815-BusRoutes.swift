class Solution {

func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    if source == target { return 0 }
    var routeBuses = [Int: [Int]]()
    
    for (bus, stops) in routes.enumerated() {
        for stop in stops {
            routeBuses[stop, default:[Int]()].append(bus)
        }
    }
    
    if routeBuses[source] == nil || routeBuses[target] == nil {
        return -1
    }
    
    var queue = routeBuses[source, default: []]
    var visited = Set(queue)
    let destBuses = Set(routeBuses[target, default:[]])
   
    var totalBusses = 1
    
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let currBus = queue.removeFirst()
            
            if destBuses.contains(currBus) {
                return totalBusses
            }
            
            for stop in routes[currBus] {
                for nextBus in routeBuses[stop, default: []] where !visited.contains(nextBus) {
                    visited.insert(nextBus)
                    queue.append(nextBus)
                }
            }
        }
        
        totalBusses += 1
    }
    
    
    return -1
}

}