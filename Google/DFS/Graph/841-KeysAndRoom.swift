func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var graph = Array(repeating: [Int](), count: rooms.count)
    var visited = Set<Int>()
    for (room, keys) in rooms.enumerated() {
        graph[room] = keys
    }
    
    isConnected(graph, 0, &visited)
    return visited.count == rooms.count
}

func isConnected(_ graph: [[Int]], _ current: Int, _ visited: inout Set<Int>) {
    visited.insert(current)
    
    for node in graph[current] {
        if !visited.contains(node) {
           isConnected(graph, node, &visited)
        }
    }
}
