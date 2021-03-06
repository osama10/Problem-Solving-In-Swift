import Foundation

/// 310
/// https://leetcode.com/problems/minimum-height-trees/discuss/76055/Share-some-thoughts

func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {

    if n == 1 { return [0] }
    if n == 2 { return [0, 1] }

    var graph = Array(repeating: [Int](), count: n)
    var indegrees = Array(repeating: 0, count: n)
    var queue = [Int]()
    var nodesLeft = n

    for edge in edges {

        indegrees[edge[0]] += 1
        indegrees[edge[1]] += 1

        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])

    }


    for (node, indegree) in indegrees.enumerated() {
        if indegree == 1 {
            queue.append(node)
        }
    }

    while nodesLeft > 2 {
        let totalLeaves = queue.count
        nodesLeft -= totalLeaves
        for _ in 0..<totalLeaves {
            let node = queue.removeFirst()
            indegrees[node] -= 1
            for neighbor in graph[node] {
                indegrees[neighbor] -= 1

                if indegrees[neighbor] == 1 {
                    queue.append(neighbor)
                }
            }
        }
    }

    return queue
}

findMinHeightTrees(6, [[3,0],[3,1],[3,2],[3,4],[5,4]])


func findMinHeightTrees1(_ n: Int, _ edges: [[Int]]) -> [Int] {
    if n <= 2 { return (0..<n).map { $0 } }
    var graph = Array(repeating: Set<Int>(), count: n)

    for edge in edges {
        graph[edge[0]].insert(edge[1])
        graph[edge[1]].insert(edge[0])
    }

    var candidates = [Int]()
    (0..<n).forEach { if graph[$0].count == 1 { candidates.append($0) } }

    while true {
        var newCandidates = [Int]()

        for candidate in candidates {
            for neigbor in graph[candidate] {
                graph[neigbor].remove(candidate)
                if graph[neigbor].count == 1 { newCandidates.append(neigbor) }
            }
        }

        if newCandidates.isEmpty{ return candidates }
        candidates = newCandidates
    }
}

findMinHeightTrees1(6, [[3,0],[3,1],[3,2],[3,4],[5,4]])


