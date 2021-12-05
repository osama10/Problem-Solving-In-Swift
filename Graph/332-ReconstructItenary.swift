import Foundation

/// https://www.youtube.com/watch?v=WYqsg5dziaQ
/// 332
func findItinerary(_ tickets: [[String]]) -> [String] {
    var graph = [String: [String]]()
    var itenary = [String]()
    
    for ticket in tickets {
        let source = ticket[0]
        let destination = ticket[1]
        graph[source, default: [String]()].append(destination)
    }
    
    graph.keys.forEach { key in graph[key]?.sort(by: > ) }
    
    buildItenary(&graph, "JFK", &itenary)
    return itenary.reversed()
}

func buildItenary(_ graph: inout [String: [String]], _ source: String, _ itenary: inout [String]) {
    while !graph[source, default: [String]()].isEmpty {
        if let destination = graph[source]?.removeLast() {
            buildItenary(&graph, destination, &itenary)
        }
    }
    itenary.append(source)
}

findItinerary(
    [["JFK","AAA"],["AAA","JFK"],["JFK","BBB"],["JFK","CCC"],["CCC","JFK"]])


