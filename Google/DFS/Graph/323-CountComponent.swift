 func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n)
    var visited = Set<Int>()
    var totalComponents = 0
   
    for edge in edges {
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])

    }
    
    for node in 0..<n {
        if !visited.contains(node) {
            isConnected(graph, node, &visited)
            totalComponents += 1
        }
    }
    
    return totalComponents
}

func isConnected(_ graph: [[Int]], _ current: Int, _ visted: inout Set<Int>) {
    visted.insert(current)
    
    for node in graph[current] {
        if !visted.contains(node) {
            isConnected(graph, node, &visted)
        }
    }
}