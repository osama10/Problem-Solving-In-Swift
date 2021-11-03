 func gardenNoAdj(_ n: Int, _ paths: [[Int]]) -> [Int] {
        var graph = Array(repeating: Set<Int>(), count: n)
        var visited = Set<Int>()
        var result = Array(repeating: 0, count: n )
        
        // build relations
        for path in paths {
            let a = path[0] - 1
            let b = path[1] - 1
            graph[a].insert(b)
            graph[b].insert(a)
        }
                
        for node in 0..<n {
            if graph[node].count == 0 {
                result[node] = 1
            } else {
                var takenColors = Set<Int>()
                
                graph[node].forEach { neighbor in
                    takenColors.insert(result[neighbor])
                }
                
                for color in 1...4 {
                    if !takenColors.contains(color) {
                        result[node] = color
                    }
                }
            }
        }        
        
        return result
    }
