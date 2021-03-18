import Foundation

/// 207
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

    var graph = Array(repeating: [Int](), count: numCourses)
    var indegree = [Int: Int]()
    var queue = [Int]()
    var result  = [Int]()

    for prereq in prerequisites {
        graph[prereq[1]].append(prereq[0])
        indegree[prereq[0], default: 0] += 1
    }

    if indegree.count == numCourses { return false }
    (0..<numCourses).forEach { if indegree[$0] == nil { queue.append($0)} }

    while !queue.isEmpty {
        let node = queue.removeLast()
        result.append(node)

        for neighbor in graph[node] {
            if let degree = indegree[neighbor] {
                indegree[neighbor] = (degree - 1 == 0) ? nil : degree - 1
                if (degree - 1 == 0 ){ queue.append(neighbor) }
            }

        }
    }

    return numCourses == result.count
}

canFinish(2, [[1,0],[0,1]])
canFinish(5, [[1,4],[2,4],[3,1],[3,2]])
canFinish(2, [[1,0]])


func canFinish1(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var graph = Array(repeating: [Int](), count: numCourses)
    var indegree = [Int: Int]()
    var stack = [Int]()
    var result = [Int]()

    for preReq in prerequisites {
        graph[preReq[1]].append(preReq[1])
        indegree[preReq[0], default: 0] += 1
    }

    if indegree.count == numCourses { return false }
    (0..<numCourses).forEach { if indegree[$0] == nil { stack.append($0)} }

    while !stack.isEmpty {
        let course = stack.removeLast()
        result.append(course)

        for dependentCourse in graph[course] {
            if let degree = indegree[dependentCourse] {
                if degree - 1 == 0 {
                    indegree[dependentCourse] = nil
                    stack.append(dependentCourse)
                } else {
                    indegree[dependentCourse] = degree - 1
                }
            }
        }
    }

    return result.count == numCourses
}

