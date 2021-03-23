// 1042

func gardenNoAdj(_ n: Int, _ paths: [[Int]]) -> [Int] {

    if paths.isEmpty { return Array(repeating: 1, count: n) }

    var graph = Array(repeating: [Int](), count: n)

    paths.forEach { path in
        graph[path[0] - 1].append(path[1] - 1)
        graph[path[1] - 1].append(path[0] - 1)
    }

    var result = Array(repeating: 0, count: n)

    for node in 0..<n {
        if result[node] == 0 {
            result[node] = 1
            var remainingColors = [4, 3, 2]
            for neigbor in graph[node] {
                if result[neigbor] == 0 {
                    result[neigbor] = remainingColors.removeLast()
                }

            }
        }
    }

    return result
}