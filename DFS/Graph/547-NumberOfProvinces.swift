    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var provinces = 0
        var  visited = Set<Int>()
    
        var graph = Array(repeating: [Int](), count: isConnected.count)
  
        for row in 0..<isConnected.count {
            for col in 0..<isConnected[0].count {
                if isConnected[row][col] == 1 {
                    graph[row].append(col)
                }
            }
        }
        
        for city in 0..<isConnected.count {
            if !visited.contains(city) {
                dfs(graph, city, &visited)
                provinces += 1
            }
        }
    
    return provinces
        
}



func dfs(_ graph: [[Int]], _ current: Int, _ visited: inout Set<Int>) {
    visited.insert(current)
    for node in graph[current] {
        if !visited.contains(node) {
            dfs(graph, node, &visited)
        }
    }
}