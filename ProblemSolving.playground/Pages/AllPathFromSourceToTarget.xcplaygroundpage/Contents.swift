import Foundation

/// 797

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var path = [Int]()
    var allPath = [[Int]]()

    dfs(graph, 0, &path,  &allPath)
    return allPath
}

func dfs(_ graph: [[Int]], _ source: Int, _ path: inout [Int], _ allPath: inout [[Int]]) {
    path.append(source)

    if source == graph.count - 1 {
        allPath.append(path)
        path.popLast()
        return
    }

    for negihbor in graph[source] { dfs(graph, negihbor,  &path,  &allPath) }

    path.popLast()
}


print(allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]]))
