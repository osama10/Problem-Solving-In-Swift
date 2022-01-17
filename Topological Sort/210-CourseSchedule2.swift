func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var hasIndegree = [Int: Int]()
    var graph = Array(repeating: Set<Int>(), count: numCourses)
    var result = [Int]()
    var stack = [Int]()
    
    for prereq in prerequisites {
        let priorCourse = prereq[1]
        let dependentCourse = prereq[0]
        graph[priorCourse].insert(dependentCourse)
        hasIndegree[dependentCourse, default: 0] += 1
    }
    
    if hasIndegree.count == numCourses { return [] }
    
    for node in 0..<numCourses {
        if hasIndegree[node] == nil {
            stack.append(node)
        }
    }
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        result.append(node)
        for child in graph[node] {
            hasIndegree[child, default: 0] -= 1
            if hasIndegree[child, default: 0] == 0 {
                stack.append(child)
            }
        }
    }
    return result.count == numCourses ? result : []
}
