import Foundation

/// 1557

func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var candidates = Set(0..<n)
    edges.forEach { candidates.remove($0[1]) }
    return Array(candidates)
}

findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]])

