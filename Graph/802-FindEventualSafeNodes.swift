class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var memo =  [Int: Bool]()
        var visited =  Array(repeating: false, count: graph.count)
        var result = [Int]()
        
        for node in 0..<graph.count {
            if !hasCycle(node, graph,&visited, &memo) {
                    result.append(node)
            } 
        }
        
        return result
    }
    
    func hasCycle(_ node: Int,
                  _ graph: [[Int]],
                  _ visited: inout [Bool],
                  _ memo: inout [Int: Bool]) -> Bool {
        
        if let cycle = memo[node] { 
            return cycle
        }
        
        visited[node] = true
        
        for neigbor in graph[node] {
            if !visited[neigbor] {
                if hasCycle(neigbor, graph ,&visited, &memo) {
                    memo[node] = true
                    return true
                }
            } else {
                memo[node] = true
                return true
            }
            
        }
        
        visited[node] =  false 
        memo[node] = false
        return false
    }
}