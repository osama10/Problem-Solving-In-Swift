import Foundation
/// 261 https://github.com/Seanforfun/Algorithm-and-Leetcode/blob/master/leetcode/261.%20Graph%20Valid%20Tree.md

class DisjointSet {
    var parent = [Int]()
    var rank = [Int]()

    init(_ n: Int) {
        (0..<n).forEach { parent.append($0) }
        rank = Array(repeating: 1, count: n)
    }

    func union(_ x: Int, _ y: Int) -> Bool {
        let xParent = find(x)
        let yParent = find(y)

        if xParent == yParent { return false }

        if rank[xParent] < rank[yParent] {
            parent[xParent] = yParent
            rank[yParent] += rank[xParent]
        } else {
            parent[yParent] = xParent
            rank[xParent] += rank[yParent]
        }

        return true
    }

    func find(_ element: Int) -> Int { parent[element] != element ? find(parent[element]) : element }

}

func validGraph(_ n: Int, _ edges: [[Int]]) -> Bool {
    let disjointSet = DisjointSet(n)
    for edge in edges { if !disjointSet.union(edge[0], edge[1]) { return false } }
    var count = 0
    for node in 0..<n { if disjointSet.find(node) == node { count += 1 } }
    return count == 1
}

validGraph(5, [[0,1], [1,2], [2,3], [1,3], [1,4]])

