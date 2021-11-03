//997

func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {

    var candidates = (1...N).reduce(into: Set<Int>()) { (set, val) in set.insert(val) }
    var trustCount = [Int: Int]()

    trust.forEach { (dependency) in
        candidates.remove(dependency[0])
        trustCount[dependency[1], default: 0] += 1
    }

    if  candidates.count != 1 { return -1 }
    for candidate in candidates {
        if trustCount[candidate, default: 0] == N - 1  { return candidate }
    }

    return -1

}