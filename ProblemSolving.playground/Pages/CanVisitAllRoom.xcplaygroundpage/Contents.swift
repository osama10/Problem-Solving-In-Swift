import Foundation
/// 841

//func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
//    if rooms.isEmpty { return true }
//    var visited = Set<Int>()
//    var totalVisits = 0
//    depthFirstSearch(rooms, 0, &totalVisits, &visited)
//    return totalVisits == rooms.count
//}
//
//func depthFirstSearch(_ graph:[[Int]], _ currentNode: Int,_ totalVisits: inout Int, _ visited: inout Set<Int>) {
//    visited.insert(currentNode)
//    totalVisits += 1
//    graph[currentNode].forEach { if !visited.contains($0) { depthFirstSearch(graph, $0, &totalVisits, &visited)} }
//}

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    let graph = rooms
    var visited = Set<Int>()
    dfs(graph, &visited, 0)
    return visited.count == rooms.count
}

func dfs(_ graph: [[Int]], _ visited: inout Set<Int>, _ node: Int) {
    visited.insert(node)
    for neighbor in graph[node] { if !visited.contains(neighbor) { dfs(graph, &visited, neighbor) } }
}

canVisitAllRooms([[1],[2],[3],[]])
