import Foundation

/// https://algorithms.tutorialhorizon.com/graph-detect-cycle-in-undirected-graph-using-dfs/
func hasCycle(_ graph: SimpleGraph) -> Bool {
    if graph.totalVertices <= 0 { return false }
    var enque = Set<Int>()
    for current in 0..<graph.totalVertices {
        if !enque.contains(current) {
            if checkCycle(graph, &enque, current,-1) { return true }
        }

    }

    return false
}

func checkCycle(_ graph: SimpleGraph, _ enque: inout Set<Int>,_ current: Int, _ source: Int) -> Bool {
    enque.insert(current)

    for neighbor in graph.vertices[current] {
        if !enque.contains(neighbor){
            if checkCycle(graph, &enque, neighbor, current) { return true }
        }
        else if neighbor != source { return true }
    }

    return false

}


let g = SimpleGraph(5)
g.addEdge(1, 0)
g.addEdge(0, 1)

g.addEdge(1, 2)
g.addEdge(2, 1)

g.addEdge(2, 0)
g.addEdge(0, 2)

g.addEdge(0, 3)
g.addEdge(3, 0)

g.addEdge(3, 4)
g.addEdge(4, 3)

hasCycle(g)

let g1 = SimpleGraph(3)

g1.addEdge(0,1)
g1.addEdge(1,0)
g1.addEdge(1,2)
g1.addEdge(2,1)

hasCycle(g1)



