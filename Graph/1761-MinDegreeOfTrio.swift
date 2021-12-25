class Solution {
    func minTrioDegree(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = Array(repeating:  Array(repeating: 0, count: n), count: n)
        var edgeCount = Array(repeating: 0, count: n)
        var result = Int.max
        
        for edge in edges {
            let u = edge[0] - 1
            let v = edge[1] - 1
            
            graph[u][v] = 1
            graph[v][u] = 1
           
            edgeCount[u] += 1
            edgeCount[v] += 1
        }
        
        for node1 in 0..<n {
            for node2 in node1+1..<n {
                if graph[node1][node2] == 0 { continue } 
                for node3 in node2+1..<n {
                    if graph[node1][node2] == 1 && graph[node1][node3] == 1 && graph[node2][node3] == 1 {
                        let count = edgeCount[node1] + edgeCount[node2] + edgeCount[node3] - 6
                        if count == 0 { return 0 }
                        result = min(result, count)
                    }
                }
            }
        }
        
        return result == Int.max ? -1 : result
    }
}