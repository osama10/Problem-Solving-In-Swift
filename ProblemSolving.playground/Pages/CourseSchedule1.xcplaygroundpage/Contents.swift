import Foundation

/// 207
func makeGraph(totalVertices: Int, edges: [[Int]]) -> SimpleGraph {
    let graph = SimpleGraph(totalVertices)
    edges.forEach { graph.addEdge($0[1], $0[0]) }
    return graph
}

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

    let graph = makeGraph(totalVertices: numCourses, edges: prerequisites)

    var queue = [Int]()
    var result = [Int]()

    for node in 0..<numCourses {
        if graph.indeg[node] == nil { queue.append(node) }
    }

    while !queue.isEmpty {
        let vertex = queue.removeFirst()
        result.append(vertex)
        for neighbor in graph.vertices[vertex] {
            if graph.indeg[neighbor] != nil {
                graph.indeg[neighbor]! -= 1
                if graph.indeg[neighbor] == 0 {
                    queue.append(neighbor)
                    graph.indeg[neighbor] = nil
                }
            }
        }
    }

    return (result.count == numCourses)
}


func canFinish1(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

    var graph = (0..<numCourses).reduce(into: [Int: [Int]]()) { (result, course) in result[course] = [] }

    var indegree = [Int: Int]()
    var queue = [Int]()
    var schedule = [Int]()

    prerequisites.forEach {
        indegree[$0[0], default: 0] += 1
        graph[$0[1]]?.append($0[0])
    }

    if indegree.count == numCourses { return false }

    (0..<numCourses).forEach { if indegree[$0] == nil { queue.append($0)} }

    while !queue.isEmpty {
        let course = queue.removeFirst()
        schedule.append(course)

        for dependentCourse in graph[course]! {
            if indegree[dependentCourse] != nil {
                 indegree[dependentCourse]! -= 1
                if indegree[dependentCourse] == 0 {
                    queue.append(dependentCourse)
                    indegree[dependentCourse] = nil
                }
            }
        }
    }

    return schedule.count == numCourses
}

canFinish(5, [[1,4],[2,4],[3,1],[3,2]])
canFinish(2, [[1,0]])
canFinish1(2, [[1,0]])
canFinish1(5, [[1,4],[2,4],[3,1],[3,2]])
