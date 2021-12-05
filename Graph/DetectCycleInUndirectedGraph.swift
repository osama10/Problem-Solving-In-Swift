func detectCycle(_ nodes: Int, _ edges: [[Int]]) -> Bool {
    var graph = Array(repeating: [Int](), count: nodes)
    edges.forEach { edge in
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    var visited = Set<Int>()

    for node in 0..<nodes {
        if !visited.contains(node) && isCyclic(graph, node, &visited, -1) {
            return true
        }
    }

    return false
}

func isCyclic(_ graph: [[Int]], _ node: Int, _ visited: inout Set<Int>, _ parent: Int) -> Bool {
    visited.insert(node)

    for neighbor in graph[node] {
        if !visited.contains(neighbor) {
            if isCyclic(graph, neighbor, &visited, node) {
                return true
            }
        } else if parent != neighbor { return true }
    }

    return false
}

detectCycle(5, [[1,0], [1, 2], [2, 0], [0, 3], [3, 4]])