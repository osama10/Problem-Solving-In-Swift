/// 1557

func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var candidates = Set(0..<n)
    for edge in edges { candidates.remove(edge[1]) }
    return Array(candidates)
}
