//https://leetcode.com/discuss/interview-question/881980/snapchat-uber-minimum-time-to-complete-all-tasks

func scheduledTask(_ times: [Int], _ preRequisites: [[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: times.count)
    var maxTime = Array(repeating: 0, count: times.count)
    var queue = [Int]()
    var indegree = [Int: Int]()
    
    for preRequisite in preRequisites {
        let first = preRequisite[0]
        let second = preRequisite[1]
        graph[first].append(second)
        indegree[second, default: 0] += 1
    }
    
    for node in 0..<times.count {
        if indegree[node, default: 0] == 0 {
            queue.append(node)
            maxTime[node] = times[node]
        }
    }
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        
        for dependent in graph[curr] {
            maxTime[dependent] = max(maxTime[dependent], maxTime[curr] + times[dependent])
            
            if let degree = indegree[dependent] {
                indegree[dependent] = degree - 1
                if indegree[dependent, default: 0] == 0 {
                    queue.append(dependent)
                }
            }
            
        }
    }
    
    return maxTime.max() ?? Int.max
}

scheduledTask([3, 5, 6], [[0, 1], [0, 2]])
