import Foundation


/// https://algorithms.tutorialhorizon.com/graph-software-installation-problem/
/// https://algorithms.tutorialhorizon.com/determine-the-order-of-tests-when-tests-have-dependencies-on-each-other/

func buildGraph(_ data: [String], _ dependencies:[(String, String)]) -> ([String: Int],[String:[String]]) {
    var graph = [String: [String]]()
    data.forEach { graph[$0] = [] }
    return addEdges(graph, dependencies)
}

func addEdges(_ graph: [String:[String]], _ dependencies:[(String, String)]) -> ([String: Int],[String:[String]]) {
    var graph = graph
    var indegree = [String: Int]()
    dependencies.forEach { dependency in
        graph[dependency.1]!.append(dependency.0)
        indegree[dependency.0] = (indegree[dependency.0] ?? 0) + 1
    }
    return (indegree, graph)
}

func buildOrder(_ softwares: [String], _ dependencies: [(String, String)]) -> [String] {
    var (indegree, graph) = buildGraph(softwares, dependencies)
    var queue = [String]()
    var result = [String]()

    softwares.forEach { if indegree[$0] == nil { queue.append($0) } }

    while !queue.isEmpty {
        let software = queue.removeFirst()
        result.append(software)
        for dependentSoftware in graph[software]! {
            if let degree = indegree[dependentSoftware] {
                if degree - 1 == 0 {
                    indegree[dependentSoftware] = nil
                    queue.append(dependentSoftware)
                } else {
                    indegree[dependentSoftware] = degree - 1
                }
            }
        }
    }

    return (result.count == softwares.count) ? result : []
}


let softwares = ["A", "B", "C", "D", "E", "F"]
let dependencies = [("E","B"), ("E", "D"), ("D", "B"), ("D", "C"), ("B","A"),("C","A")]
buildOrder(softwares, dependencies)
