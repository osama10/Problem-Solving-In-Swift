// 310 
func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
    if n < 3 { return (0..<n).map { $0 } }
    var graph = Array(repeating: Set<Int>(), count: n)
    var queue = [Int]()

    edges.forEach { edge in
        graph[edge[0]].insert(edge[1])
        graph[edge[1]].insert(edge[0])
    }

    (0..<n).forEach{ if graph[$0].count == 1 { queue.append($0)} }

    while true {
        var newCandidates = [Int]()
        for node in queue {
            for childNode in graph[node] {
                graph[childNode].remove(node)
                if graph[childNode].count == 1 {
                    newCandidates.append(childNode)
                }
            }
        }
        if newCandidates.isEmpty { return queue }
        queue = newCandidates
    }
}
