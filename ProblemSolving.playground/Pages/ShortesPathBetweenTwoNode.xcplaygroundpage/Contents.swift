import Foundation

let freinds = ["cab", "car", "cat", "bar", "bat", "mat"]
let dependencies = [["cab", "cat"], ["cab", "car"], ["car", "cat"], ["car", "bar"], ["bar", "bat"], ["cat", "bat"], ["cat", "mat"], ["mat", "bat"]]
var graph = freinds.reduce(into: [String: [String]]()) { (result, node) in result[node] = [String]() }

dependencies.forEach { graph[$0[0], default: []].append($0[1]) }

func bfs(_ grap: [String:[String]], _ node1: String, _ node2: String) -> Int {
    if node1 == node2 { return 0 }
    var queue = [String]()
    var enqued = Set<String>()
    var visited = [String: String]()

    queue.append(node1)
    enqued.insert(node1)
    visited[node1] = ""

    while !queue.isEmpty {
        let node = queue.removeFirst()
        for neighbor in graph[node]!{
            if !enqued.contains(neighbor) {
                enqued.insert(neighbor)
                queue.append(neighbor)
                visited[neighbor] = node
                if neighbor == node2 { break }

            }
        }
    }

    if visited[node2] == nil { return -1 }

    var path = [node2]
    var parent = visited[node2]!

    while parent != node1 {
        parent = visited[parent]!
        path.append(parent)
    }


    return path.count
}


bfs(graph, "mat", "mat")

func shortesPath(_ graph: [String:[String]], _ node1: String, _ node2: String) -> [String] {
    if node1 == node2 { return [node1] }

    var queue = [String]()
    var visited = Set<String>()
    var predecessor = [String: String]()

    queue.append(node1)
    visited.insert(node1)
    predecessor[node1] = nil

    while !queue.isEmpty {
        let node = queue.removeFirst()

        for neighbor in graph[node]! {
            if !visited.contains(neighbor) {
                visited.insert(neighbor)
                queue.append(neighbor)
                predecessor[neighbor] = node
                if neighbor == node2 { break }
            }
        }
    }

    if predecessor[node2] ==  nil { return [] }

    var parent = predecessor[node2]!
    var path = [node2]

    while parent != node1 {
        path.append(parent)
        parent = predecessor[parent]!
    }

    path.append(parent)

    return path
}

shortesPath(graph,"car", "cab")


