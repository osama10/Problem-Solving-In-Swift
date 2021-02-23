
import Foundation

/// 684
class DisjointSet {

    var parent: [Int] = []
    var rank: [Int] = []

    init(totalSets: Int) {
        (0...totalSets).forEach { parent.append($0) }
        rank = Array(repeating: 1, count: totalSets)
    }

    func find(_ x: Int) -> Int { (parent[x] == x) ? x : find(parent[x]) }

    func union(_ x1: Int, _ x2: Int) -> Bool {
        let parentX1 = find(x1)
        let parentX2 = find(x2)

        if parentX1 == parentX2 { return false }

        if rank[parentX1] < rank[parentX2] {
            parent[parentX1] = parentX2
            rank[parentX2] += rank[parentX1]
        } else {
            parent[parentX2] = parentX1
            rank[parentX1] += rank[parentX2]
        }

        return true
    }
}

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    let disjointSet = DisjointSet(totalSets: edges.count + 1)
    for edge in edges {
        if !disjointSet.union(edge[0], edge[1]) {
            return edge
        }
    }

    return []
}


findRedundantConnection([[1,2], [1,3], [2,3]])
findRedundantConnection([[1,2], [2,3], [3,4], [1,4], [1,5]])
