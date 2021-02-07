import Foundation

/// Not Leetcode.
func bfs(_ graph: [[Int]], _ source: Int) -> [Int] {
    var queue = [Int]()
    var enqued = Set<Int>()
    var visited = [Int]()

    queue.append(source)
    enqued.insert(source)

    while !queue.isEmpty {
        let source = queue.removeFirst()
        visited.append(source)

        for neigbor in graph[source] {
            if !enqued.contains(neigbor) {
                enqued.insert(neigbor)
                queue.append(neigbor)
            }
        }
    }

    return visited
}

func dfs(_ graph: [[Int]], _ source: Int) -> [Int] {

    var stack = [Int]()
    var visited = [Int]()
    var pushed = Set<Int>()

    stack.append(source)
    pushed.insert(source)

    while !stack.isEmpty {
        let source = stack.popLast()!
        visited.append(source)

        for child in graph[source] {
            if !pushed.contains(child) {
                stack.append(child)
                pushed.insert(child)
            }
        }
    }

    return visited
}

func isConnectedBFS(_ graph: [[Int]]) -> Bool {
    if graph.isEmpty { return true }
    let vertices = Set(bfs(graph, 0))
    return graph.enumerated().allSatisfy { vertices.contains($0.offset) }
}

isConnectedBFS([[1], [0,3],[3],[1,2,4], [3]])
isConnectedBFS([[1],[0,3],[3],[1,2], []])

func isConnectedDFS(_ graph: [[Int]]) -> Bool {
    if graph.isEmpty { return true }
    let vertices = Set(dfs(graph, 0))
    return graph.enumerated().allSatisfy { vertices.contains($0.offset) }
}

isConnectedDFS([[1], [0,3],[3],[1,2,4], [3]])
isConnectedDFS([[1],[0,3],[3],[1,2], []])
