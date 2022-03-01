class Solution {
func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
    var graph = [Int: Set<Int>]()
   
    for connection in connections {
        let u = connection[0]
        let v = connection[1]
        
        graph[u,default: Set<Int>()].insert(v)
        graph[v, default: Set<Int>()].insert(u)

    }
    
    var result = [[Int]]()
    
    for connection in connections {
        graph[connection[0]]?.remove(connection[1])
        graph[connection[1]]?.remove(connection[0])
        var visited = Array(repeating: false, count: n)
       
        if n != dfs(connection[0], graph, &visited) {
            result.append(connection)
        }
        
        graph[connection[0]]?.insert(connection[1])
        graph[connection[1]]?.insert(connection[0])
    }
    
    return result
}

func dfs(_ node: Int, _ graph: [Int: Set<Int>], _ visited: inout [Bool]) -> Int {
    
    visited[node] = true
    
    var result = 1
    
    for nextNode in graph[node, default: Set<Int>()] {
        if !visited[nextNode] {
            result += dfs(nextNode, graph, &visited)
        }
    }
    
    return result
}
}