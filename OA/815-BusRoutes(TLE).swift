class Solution {

func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    var routeBuses = [Int: [Int]]()
    var queue = [(place: source, bus: -1, count: 0)]
    var visited = Set<Int>()
    visited.insert(source)

    for (bus, stops) in routes.enumerated() {
        for stop in stops {
            routeBuses[stop, default:[Int]()].append(bus)
        }
    }
    
    while !queue.isEmpty {
        let data = queue.removeFirst()
       
        if data.place == target {
            return data.count
        }
        
        for bus in routeBuses[data.place, default: []] {
            let stops = routes[bus]
            for nextStop in stops {
                if !visited.contains(nextStop) {
                    let count = bus == data.bus ? data.count : data.count + 1
                    let nextData = (nextStop, bus, count)
                    queue.append(nextData)
                    visited.insert(nextStop)
                }
            }
        }
    }
    
    return -1
}

}