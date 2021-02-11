
import Foundation


///997 
func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
    var candidates = Set(Array(1...N))
    var trusted = [Int:Int]()
    for t in trust{
         let a = t[0]
         let b = t[1]
        candidates.remove(a)
         trusted[b, default: 0] += 1
     }

     for candidate in candidates{
         if trusted[candidate, default: 0] == N-1{
             return candidate
         }
     }

     return -1
}


findJudge(2, [[1,2]])
findJudge(3, [[1,3],[2,3]])
findJudge(3, [[1,3],[2,3],[3,1]])
findJudge(3, [[1,2],[2,3]])
findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]])
findJudge(1, [])
