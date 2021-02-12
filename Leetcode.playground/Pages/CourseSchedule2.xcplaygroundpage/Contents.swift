import Foundation
/// 208
func makeGraph(totalVertices: Int, edges: [[Int]]) -> SimpleGraph {
    let graph = SimpleGraph(totalVertices)
    edges.forEach { graph.addEdge($0[1], $0[0]) }
    return graph
}

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
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

    return (result.count == numCourses) ? result : []
}

findOrder(1, [])
