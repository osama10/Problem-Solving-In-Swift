/// 4.1 Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

func hasRoute(_ source: Int, _ target: Int, graph: [[Int]]) -> Bool {
    var visited = Set<Int>()
    return depthFirstSearch(source, target, graph, &visited)
}

func depthFirstSearch(_ current: Int, _ target: Int, _ graph: [[Int]], _ visited: inout Set<Int>) -> Bool {
    visited.insert(current)
    
    if current == target { return true }
    
    for neighbor in graph[current] {
        if !visited.contains(neighbor) && depthFirstSearch(neighbor, target, graph, &visited) {
            return true
        }
    }
    
    visited.remove(current)
    return false
}

let graph = [[1,2], [0], [3], [0], [5], [0]]


print(hasRoute(3, 1, graph: graph))
