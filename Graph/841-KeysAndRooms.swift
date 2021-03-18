/// 841 

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