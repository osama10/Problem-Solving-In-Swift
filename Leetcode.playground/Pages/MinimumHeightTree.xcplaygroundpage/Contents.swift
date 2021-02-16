import Foundation



//func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
//
//    if n == 1 { return [0] }
//    if n == 2 { return [0, 1] }
//
//    var graph = [[Int]]()
//    var result = [Int]()
//
//    (0..<n).forEach { _ in graph.append([]) }
//
//    edges.forEach { edge in
//        let node1 = edge[0]
//        let node2 = edge[1]
//        graph[node1].append(node2)
//        graph[node2].append(node1)
//    }
//
//    var minHeight = Int.max
//
//    for node in 0..<n {
//        var maxHeight = Int.min
//        for neighbor in 0..<n {
//            if node != neighbor {
//                maxHeight = max(maxHeight, bfs(graph, node, neighbor))
//            }
//        }
//        minHeight = min(minHeight, maxHeight)
//        result.append(maxHeight)
//    }
//
//    return result
//        .enumerated()
//        .filter { $0.element == minHeight }
//        .map{ $0.offset }
//}
//
//func bfs(_ graph: [[Int]], _ source: Int, _ dest: Int) -> Int {
//
//    var queue = [source]
//    var enqueued = Set(arrayLiteral: source)
//    var result : [Int: Int] = [source: source]
//
//    while !queue.isEmpty {
//        let node = queue.removeFirst()
//        var shouldBreak = false
//        for neighbor in graph[node] {
//            if !enqueued.contains(neighbor) {
//                queue.append(neighbor)
//                enqueued.insert(neighbor)
//                result[neighbor] = node
//
//                if neighbor == dest {
//                    shouldBreak = true
//                    break
//                }
//
//            }
//        }
//        if shouldBreak { break }
//    }
//
//    var count = 0
//    var lastNode = dest
//
//    while lastNode != source {
//        lastNode = result[lastNode]!
//        count += 1
//    }
//
//    return count
//}

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


