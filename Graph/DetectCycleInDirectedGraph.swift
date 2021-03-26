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
