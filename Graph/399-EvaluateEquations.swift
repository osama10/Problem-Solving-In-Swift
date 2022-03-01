class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var graph = [String: [(dest: String, weight: Double)]]()
        var result = [Double]()
        
        for (eq, value) in zip(equations, values) {
            let a = eq[0]
            let b = eq[1]
            
            graph[a, default: []].append((b,value))            
            graph[b, default: []].append((a, 1/value))

        }
        
        for query in queries {
            result.append(evaluateEquation(query[0], query[1], &graph))
        }
        
        return result
    }
    
    
    func evaluateEquation(_ a: String, _ b: String, _ graph:  inout [String: [(dest: String, weight: Double)]]) -> Double {
        if graph[a] == nil || graph[b] == nil { return -1.0 }
        if a == b { return 1.0 }
        
        var queue = [(node: a, result: 1.0)]
        var visited = Set([a])
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let top = queue.removeFirst()
                
                if top.node == b {
                    return top.result
                }
                
                for nextNode in graph[top.node, default: []] where !visited.contains(nextNode.dest) {
                    let result = top.result * nextNode.weight
                    queue.append((nextNode.dest, result))
                    visited.insert(nextNode.dest)
                }
            }
        }
        
        return -1.0
    }
}