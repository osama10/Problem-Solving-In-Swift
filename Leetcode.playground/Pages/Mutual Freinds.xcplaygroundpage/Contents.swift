import Foundation

/// Not a leet code problem
/*
Vincent has three friends, Chesley, Ruiz and Patrick. Ruiz has friends as well: Ray, Sun, and a mutual friend of Vincent’s. Patrick is friends with Cole and Kerry. Cole is friends with Ruiz and Vincent. Create an adjacency list that represents this friendship graph. Which mutual friend do Ruiz and Vincent share?
 */
let graph = AdjacencyList<String>()

let vincent = graph.createVertex(data: "vincent")
let chesley = graph.createVertex(data: "chesley")
let ruiz = graph.createVertex(data: "ruiz")
let patrick = graph.createVertex(data: "patrick")
let ray = graph.createVertex(data: "ray")
let sun = graph.createVertex(data: "sun")
let cole = graph.createVertex(data: "cole")
let kerry = graph.createVertex(data: "kerry")

graph.add(edge: .undirected, from: vincent, to: chesley, weight: 1)
graph.add(edge: .undirected, from: vincent, to: ruiz, weight: 1)
graph.add(edge: .undirected, from: vincent, to: patrick, weight: 1)
graph.add(edge: .undirected, from: ruiz, to: ray, weight: 1)
graph.add(edge: .undirected, from: ruiz, to: sun, weight: 1)
graph.add(edge: .undirected, from: patrick, to: cole, weight: 1)
graph.add(edge: .undirected, from: patrick, to: kerry, weight: 1)
graph.add(edge: .undirected, from: cole, to: ruiz, weight: 1)
graph.add(edge: .undirected, from: cole, to: vincent, weight: 1)

func mutualFriends(graph: AdjacencyList<String>, person1: Vertex<String>, person2: Vertex<String>) -> Set<String> {
    let freindsOfPerson1 = Set(graph.edges(from: person1).map{ $0.destination.data })
    let freindsOfPerson2 = Set(graph.edges(from: person2).map{ $0.destination.data })
    let mutualFriends = freindsOfPerson1.intersection(freindsOfPerson2)
    return mutualFriends
}

print(mutualFriends(graph: graph, person1: ruiz, person2: vincent))
