// https://www.geeksforgeeks.org/strongly-connected-components/?ref=lbp

func stronglyConnected(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
    var stack = [Int]()
    var visited = Array(repeating: false, count: n)
    var graph = Array(repeating: [Int](), count: n)
    var components = [[Int]]()

    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        graph[u].append(v)
    }
    
    for node in 0..<n {
        if !visited[node] {
            dfs(graph, node, &visited, &stack)
        }
    }
    
    graph = Array(repeating: [Int](), count: n)
    visited = Array(repeating: false, count: n)
    
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        graph[v].append(u)
    }
    
    while  !stack.isEmpty {
        let node = stack.removeLast()
        if !visited[node] {
            var path = [Int]()
            cretePath(graph, node, &visited, &path)
            components.append(path)
            print(path)

        }
    }
    
    return components
}

func dfs(_ graph: [[Int]], _ node: Int, _ visited: inout [Bool], _ stack: inout [Int]) {
    
    visited[node] = true
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            dfs(graph, nextNode, &visited, &stack)
        }
    }
    
    stack.append(node)
    
}

func cretePath(_ graph: [[Int]], _ node: Int, _ visited: inout [Bool], _ path: inout [Int]) {
    
    visited[node] = true
    path.append(node)
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            cretePath(graph, nextNode, &visited, &path)
        }
    }
        
}

stronglyConnected(5, [[1, 0],[0, 2], [2, 1], [0, 3], [3, 4]])