class Solution {
    func alienOrder(_ words: [String]) -> String {        
        let words = words.map { Array($0) }
        var indegree = [Character: Int]()
        var graph = [Character: [Character]]()
        var queue = [Character]()
        var result = [Character]()
        
        for word in words {
            for char in word {
                graph[char] = []
            }
        }
        
        for idx in 0..<words.count - 1 {
            
            let dependency = createDependency(words[idx], words[idx + 1])
            if dependency.count == 1 { return "" }
           
            if !dependency.isEmpty {
                let source = dependency[0]
                let dependent = dependency[1]
                graph[source]!.append(dependent)
                indegree[dependent, default: 0] += 1
            }
        }
        
        for node in graph.keys {
            if indegree[node, default: 0] == 0 {
                queue.append(node)
            }
        }
       
        while !queue.isEmpty {
            let node = queue.removeLast()
            result.append(node)
            for dependent in graph[node, default: []] {
                indegree[dependent, default: 0] -= 1
                if indegree[dependent, default: 0] == 0 {
                    queue.append(dependent)
                }
            }
        }
        
        return result.count == graph.keys.count ? String(result) : "" 
    }
    
    func createDependency(_ word1: [Character], _ word2: [Character]) -> [Character] {
        
        for index in 0..<min(word1.count, word2.count) {
            if word1[index] != word2[index] {
                return [word1[index], word2[index]]
            }
        }
        
        // prefix case
        return (word1.count > word2.count) ? [word1[0]] : []
    }
}

