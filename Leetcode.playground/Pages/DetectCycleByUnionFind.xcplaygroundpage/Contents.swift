//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/// https://www.geeksforgeeks.org/union-find/
class DisjointSet {
    var parent: [Int] = []
    var rank: [Int]

    init(_ totalElements: Int) {
        rank = Array(repeating: 1, count: totalElements)
        (0...totalElements).forEach { parent.append($0) }
    }

    func find(_ element: Int) -> Int {
        if parent[element] == element {
            return element
        }
        return find(parent[element])
    }

    func union(_ element1: Int, _ element2: Int) {

        let element1Rep = find(element1)
        let element2Rep = find(element2)

        if element1Rep == element2Rep { return }

        if rank[element1Rep] < rank[element2Rep] { parent[element1Rep] = element2Rep }
        else if rank[element1Rep] > rank[element2Rep] { parent[element2Rep] = element1Rep }
        else {
            parent[element1Rep] = element2Rep
            rank[element2Rep] += 1
        }
    }

    func areElementsInSameSet(_ element1: Int, _ element2: Int) -> Bool { find(element1) == find(element2) }
}

class UndirectedGraph {
    var adjList = [[Int]]()
    var disjointSet: DisjointSet

    init(_ totalVertices: Int) {
        disjointSet = DisjointSet(totalVertices)
        (0..<totalVertices).forEach { _ in adjList.append([]) }
    }

    func addEdge(_ vertice1: Int, _ vertice2: Int) {
        adjList[vertice1].append(vertice2)
        adjList[vertice2].append(vertice1)
    }
}


var graph = UndirectedGraph(3)

graph.addEdge(0, 1)
graph.addEdge(1, 2)
graph.addEdge(2, 0)

func hasCycle(_ graph: UndirectedGraph) -> Bool {
    if graph.adjList.isEmpty { return false }

    for vertex in 0..<graph.adjList.count {
        for neighbor in graph.adjList[vertex] {
            if  graph.disjointSet.areElementsInSameSet(neighbor, vertex) { return true }
            graph.disjointSet.union(vertex,neighbor)
        }
    }

    return false
}


print(hasCycle(graph))
