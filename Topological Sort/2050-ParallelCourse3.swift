class Solution {
    func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
        var graph = Array(repeating: [Int](), count: n)
        var maxTime = Array(repeating: 0, count: n)
        var indegree = [Int: Int]()
        var queue = [Int]()
        
        for relation in relations {
            let prevCourse = relation[0] - 1
            let nextCourse = relation[1] - 1
            indegree[nextCourse, default: 0] += 1
            graph[prevCourse].append(nextCourse)
        }
        
        for node in 0..<n {
            if indegree[node] == nil {
                queue.append(node)
                maxTime[node] = time[node]
            }
        }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            for nextCourse in graph[node] {
                maxTime[nextCourse] = max(maxTime[nextCourse], time[nextCourse] + maxTime[node])
                if let degree = indegree[nextCourse] {
                    if degree == 1 {
                        indegree[nextCourse]  = nil
                        queue.append(nextCourse)
                    } else {
                        indegree[nextCourse]  = degree - 1
                    }
                }
            }
        }
        
        return maxTime.max() ?? Int.max
    }
}