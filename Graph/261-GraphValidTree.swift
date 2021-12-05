func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    guard n - 1 == edges.count  else { return false }
    var graph = Array(repeating: [Int](), count: n)
    var visited = Set<Int>()
 
    for edge in edges {
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    
    return !hasCycle(graph, 0, -1, &visited) && visited.count == n
}

func hasCycle(_ graph: [[Int]], _ currentNode: Int, _ parentNode: Int, _ visited: inout Set<Int>) -> Bool {
    
    visited.insert(currentNode)
    
    for child in graph[currentNode] {
        if !visited.contains(child) {
            if hasCycle(graph, child, currentNode, &visited) {
                return true
            }
        } else if  parentNode != child {
            return true
        }
    }
    
    return false
}
