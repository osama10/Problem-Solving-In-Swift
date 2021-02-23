import Foundation
/// 841

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    if rooms.isEmpty { return true }
    var visited = Set<Int>()
    var totalVisits = 0
    depthFirstSearch(rooms, 0, &totalVisits, &visited)
    return totalVisits == rooms.count
}

func depthFirstSearch(_ graph:[[Int]], _ currentNode: Int,_ totalVisits: inout Int, _ visited: inout Set<Int>) {
    visited.insert(currentNode)
    totalVisits += 1
    graph[currentNode].forEach { if !visited.contains($0) { depthFirstSearch(graph, $0, &totalVisits, &visited)} }
}

canVisitAllRooms([[1,3],[3,0,1],[2],[0]])
