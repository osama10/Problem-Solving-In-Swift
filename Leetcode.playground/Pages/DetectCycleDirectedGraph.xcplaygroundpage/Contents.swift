import Foundation

/// https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-a-directed-graph/
func hasCycle(_ graph: SimpleGraph) -> Bool {
    if graph.totalVertices == 0 { return false }
    var enqued = Set<Int>()
    for source in 0..<graph.totalVertices {
        if checkCycles(graph, source: source, enqued: &enqued) { return true }
    }
    return false
}

func checkCycles(_ graph: SimpleGraph, source: Int, enqued: inout Set<Int>) -> Bool {

    enqued.insert(source)

    for neigbor in graph.vertices[source] {
        if enqued.contains(neigbor) { return true }
        else { if checkCycles(graph, source: neigbor, enqued: &enqued){ return true } }
    }

    enqued.remove(source)
    return false
}


let graph1 = SimpleGraph(4)

graph1.addEdge(0, 1)
graph1.addEdge(1, 2)
graph1.addEdge(2, 3)
graph1.addEdge(3, 1)

let graph2 = SimpleGraph(1)
graph2.addEdge(0, 0)

let graph3 = SimpleGraph(4)

graph3.addEdge(0, 1)
graph3.addEdge(1, 2)
graph3.addEdge(2, 3)

hasCycle(graph1) // true
hasCycle(graph2) // true
hasCycle(graph3) // false

