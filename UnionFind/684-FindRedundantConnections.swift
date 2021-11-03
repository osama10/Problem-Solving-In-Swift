class DisjointSet {
    var parent = [Int]()
    var rank : [Int]

    init(_ n: Int) {
        rank = Array(repeating: 1, count: n)
        (0..<n).forEach{ parent.append($0) }
    }

    func find(_ x: Int) -> Int { (parent[x] == x) ? x : find(parent[x]) }

    func union(_ x: Int, _ y: Int) -> Bool {

        let xParent = find(x)
        let yParent = find(y)

        if xParent == yParent { return false }

        if rank[xParent] > rank[yParent] {
            parent[yParent] = xParent
            rank[xParent] += rank[yParent]
        }
        else {
            parent[xParent] = yParent
            rank[yParent] += rank[xParent]
        }

        return true
    }
}

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    let disjointSet = DisjointSet(edges.count + 1)
    for edge in edges { if !disjointSet.union(edge[0], edge[1]) { return edge } }
    return []
}


findRedundantConnection([[1,2], [1,3], [2,3]])
findRedundantConnection([[1,2], [2,3], [3,4], [1,4], [1,5]])
