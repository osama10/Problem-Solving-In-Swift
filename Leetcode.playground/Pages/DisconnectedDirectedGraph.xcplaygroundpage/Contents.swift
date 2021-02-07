import Foundation


func isConnectedDFS(_ graph: [[Int]]) -> Bool {
    if graph.isEmpty { return true }
    let totalVertices = graph.count

    for vertex in 0..<graph.count {
        let paths = dfs(graph, vertex)
        if paths.count != totalVertices { return false }
    }

    return true
}

func isConnectedBFS(_ graph: [[Int]]) -> Bool {
    if graph.isEmpty { return true }
    let totalVertices = graph.count

    for vertex in 0..<graph.count {
        let paths = bfs(graph, vertex)
        if paths.count != totalVertices { return false }
    }

    return true
}

isConnectedBFS([[1,2,3,4], [0,2,3,4],[0,1,3,4], [0,1,2,4],[0,1,2,3]])

isConnectedBFS([[1,2],[3],[3],[]])
isConnectedBFS([[4,3,1],[3,2,4],[3],[4],[]])
isConnectedBFS([[1],[]])
isConnectedBFS([[1,2,3],[2],[3],[]])
isConnectedBFS([[1,3],[2],[3],[]])

isConnectedDFS([[1,2,3,4], [0,2,3,4],[0,1,3,4], [0,1,2,4],[0,1,2,3]])

isConnectedDFS([[1,2],[3],[3],[]])
isConnectedDFS([[4,3,1],[3,2,4],[3],[4],[]])
isConnectedDFS([[1],[]])
isConnectedDFS([[1,2,3],[2],[3],[]])
isConnectedDFS([[1,3],[2],[3],[]])

