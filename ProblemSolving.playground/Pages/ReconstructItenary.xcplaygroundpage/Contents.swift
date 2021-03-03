
import Foundation

/// https://www.youtube.com/watch?v=WYqsg5dziaQ
/// 332
func findItinerary(_ tickets: [[String]]) -> [String] {

    var graph = [String: [String]]()
    var route = [String]()

    // creating graph
    for ticket in tickets { graph[ticket[0], default: [String]()].append(ticket[1]) }

    // sorting in-place
    graph.keys.forEach { graph[$0]?.sort( by: > ) }

    // creating path
    dfs(&graph, "JFK", &route)

    return route.reversed()
}

func dfs(_ graph: inout [String: [String]], _ node: String, _ routes: inout[String]) {

    if graph[node] != nil {
        while !graph[node]!.isEmpty {
            if let next = graph[node]?.removeLast() {
                dfs(&graph, next, &routes)
            }
        }
    }

    routes.append(node)
}

findItinerary(
    [["JFK","AAA"],["AAA","JFK"],["JFK","BBB"],["JFK","CCC"],["CCC","JFK"]])



