import Foundation

/// https://algorithms.tutorialhorizon.com/check-if-given-undirected-graph-is-connected-or-not/
func isConnectedBFS(_ graph: [[Int]]) -> Bool {
    if graph.isEmpty { return true }
    let vertices = bfs(graph, 0)
    return graph.count == vertices.count
}

isConnectedBFS([[1], [0,3],[3],[1,2,4], [3]])
isConnectedBFS([[1],[0,3],[3],[1,2], []])

func isConnectedDFS(_ graph: [[Int]]) -> Bool {
    if graph.isEmpty { return true }
    let vertices = dfs(graph, 0)
    return graph.count == vertices.count
}

isConnectedDFS([[1], [0,3],[3],[1,2,4], [3]])
isConnectedDFS([[1],[0,3],[3],[1,2], []])
