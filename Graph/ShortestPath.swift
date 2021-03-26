
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

