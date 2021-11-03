  func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 2 else { return (0..<n).map { $0 } }
        var candidates = Array(repeating: Set<Int>(), count: n)
        var leaves = [Int]()
        
        for edge in edges {
            candidates[edge[0]].insert(edge[1])
            candidates[edge[1]].insert(edge[0])
        }
        
        for node in 0..<n {
            if candidates[node].count == 1 {
                leaves.append(node)
            }
        }
        
        while true {
            var newLeaves = [Int]()
            for leave in leaves {
                for neighbor in candidates[leave] {
                    candidates[neighbor].remove(leave)
                    if candidates[neighbor].count == 1 {
                        newLeaves.append(neighbor)
                    }
                }
            }
            
            if newLeaves.isEmpty { return leaves}
            leaves = newLeaves
        }
    }