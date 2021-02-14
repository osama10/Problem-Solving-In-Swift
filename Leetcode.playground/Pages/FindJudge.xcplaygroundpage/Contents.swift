
import Foundation


///997 

func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {

    var candidates = (1...N).reduce(into: Set<Int>()) { (set, val) in set.insert(val) }
    var trustCount = [Int: Int]()

    trust.forEach { (dependency) in
        let personWhoTrust = dependency[0]
        let personBeingTrusted = dependency[1]
        candidates.remove(personWhoTrust)
        trustCount[personBeingTrusted, default: 0] += 1
    }

    if candidates.count > 1 { return -1 }
    for candidate in candidates {
        if trustCount[candidate, default: 0] == N - 1  { return candidate }
    }

    return -1

}

findJudge(2, [[1,2]])
findJudge(3, [[1,3],[2,3]])
findJudge(3, [[1,3],[2,3],[3,1]])
findJudge(3, [[1,2],[2,3]])
findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]])
findJudge(1, [])
