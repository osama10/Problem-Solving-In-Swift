
import Foundation

/// Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

func routeBetweenTwoNodes(graph: SimpleGraph, node1: Int, node2: Int) -> Bool {

    var queue = [Int]()
    var enqued = Set<Int>()

    queue.append(node1)
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for neighbor in graph.vertices[node] {
            if !enqued.contains(neighbor) {
                if neighbor == node2 { return true }
                queue.append(neighbor)
                enqued.insert(neighbor)
            }
        }
    }

    return false
}


let g = SimpleGraph(4)
g.addEdge(0, 1)
g.addEdge(0, 2)
g.addEdge(1, 2)
g.addEdge(2, 0)
g.addEdge(2, 3)
g.addEdge(3, 3)

routeBetweenTwoNodes(graph: g, node1: 1, node2: 3)
routeBetweenTwoNodes(graph: g, node1: 3, node2: 1)
