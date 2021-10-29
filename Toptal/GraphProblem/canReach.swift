func solution(_ n: Int, _ arrA: [Int], _ arrB: [Int]) -> Bool {
    var graph = (1...n).reduce(into: [Int: Set<Int>]()) { $0[$1] = Set<Int>() }
    
    for i in 0..<arrA.count {
        let a = arrA[i]
        let b = arrB[i]
        
        graph[a]?.insert(b)
        graph[b]?.insert(a)
    }
    
    return dfs(graph, 1, n)
}

func dfs(_ graph: [Int: Set<Int>], _ start: Int, _ target: Int) -> Bool {
    
    if start == target {
        return true
    }
        
    if let children = graph[start] {
        if children.contains(start + 1) {
            if dfs(graph, start + 1, target) {
                return true
            }
        }
    }
    
    return false
}


solution(4, [1, 2, 4, 4, 3], [2, 3, 1, 3, 1])
solution(4, [1, 2, 1, 3], [2, 4, 3, 4])
solution(6, [2, 4, 5, 3], [3, 5, 6, 4])
solution(3, [1, 3], [2, 2])
