// 797


// O(N* 2N)
func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var allPaths = [[Int]]()
    var paths = [Int]()
    dfs(graph, &paths, &allPaths, 0)
    return allPaths
}


func dfs(_ graph:[[Int]], _ paths: inout[Int], _ allPaths : inout[[Int]], _ node: Int) {
    paths.append(node)
    if node == graph.count - 1 { allPaths.append(paths) }
    else { for neighbor in graph[node] { dfs(graph, &paths, &allPaths, neighbor) } }
    paths.removeLast()
}