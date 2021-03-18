import Foundation

/// 46
func permute(_ nums: [Int]) -> [[Int]] {
    var graph = nums.reduce(into: [Int: Set<Int>]()) { (graph, node) in graph[node] = Set<Int>() }
    for  node in nums {
        for neigbor in nums {
            if node != neigbor { graph[node]?.insert(neigbor) }
        }
    }
    var totalPaths = [[Int]]()

    for node in graph.keys {
        var path = [Int]()
        var visited = Set<Int>()

        dfs(graph, &path, &totalPaths, node, visted: &visited)
    }

    return totalPaths
}


func dfs( _ graph: [Int: Set<Int>], _ path: inout [Int], _ totalPaths: inout [[Int]], _ node: Int, visted: inout Set<Int>) {
    visted.insert(node)
    path.append(node)

    if path.count == graph.count { totalPaths.append(path) }
    else { for neighbor in graph[node]! { if !visted.contains(neighbor) { dfs(graph, &path, &totalPaths, neighbor, visted: &visted) }} }

    visted.remove(node)
    path.popLast()
}


permute([1])



