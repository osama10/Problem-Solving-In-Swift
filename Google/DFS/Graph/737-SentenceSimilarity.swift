class Solution {
    
    func areSentencesSimilarTwo(_ sentence1: [String], _ sentence2: [String], _ similarPairs: [[String]]) -> Bool {
        guard sentence1.count == sentence2.count else { return false }
        
        var graph = buildGraph(similarPairs)
        
        for i in 0..<sentence1.count {
            let word1 = sentence1[i]
            let word2 = sentence2[i]
            var visited = Set<String>()
            
            if !dfs(graph, word1, word2, &visited) {
                return false
            }
        }
        
        return true
    }
    
    func dfs(_ graph: [String: [String]], _ source: String, _ target: String, _ visited: inout Set<String>) -> Bool {
        if source == target { return true }
        
        visited.insert(source)
        
        for next in graph[source, default: [String]()] {
            if !visited.contains(next) {
                if dfs(graph, next, target, &visited) {
                    return true
                }
            }
        }
        
        return false
    }
    
    
    func buildGraph(_ pairs: [[String]]) -> [String: [String]] {
        var graph = [String: [String]]()
        
        for pair in pairs {
            var node1 = pair[0]
            var node2 = pair[1]
            graph[node1, default: [String]()].append(node2)
            graph[node2, default: [String]()].append(node1)
        }
        
        return graph
    }
}