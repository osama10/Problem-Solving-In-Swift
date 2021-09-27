import Foundation

/// https://www.techiedelight.com/check-given-graph-strongly-connected-not/#:~:text=A%20simple%20solution%20would%20be,the%20graph%20is%20strongly%20connected.


func isConnected(_ edges: [[Int]], _ total: Int) -> Bool {
    var graph = Array(repeating: [Int](), count: total)
    var visited = Set<Int>()
   
    for edge in edges {
        graph[edge[0]].append(edge[1])
    }
    
    isConnected(graph, 0, &visited)
    if visited.count != total { return false }
    
    graph = Array(repeating: [Int](), count: total)
    visited = Set<Int>()
   
    for edge in edges {
        graph[edge[1]].append(edge[0])
    }
    
    isConnected(graph, 0, &visited)
    return visited.count == total

}
func isConnected(_ graph: [[Int]], _ vertex: Int, _ visited: inout Set<Int>) {
    visited.insert(vertex)
    
    for neighbor in graph[vertex] {
        if !visited.contains(neighbor) {
            isConnected(graph, neighbor, &visited)
        }
    }
}

             
isConnected([[0, 4], [1, 0], [1, 2], [2, 1], [2, 4], [3, 1], [3, 2], [4, 3]], 5)
isConnected([[0, 1], [0, 2], [1, 2]], 5)

