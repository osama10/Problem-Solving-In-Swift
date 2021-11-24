/**
 * The knows API is defined in the parent class Relation.
 *     func knows(_ a: Int, _ b: Int) -> Bool;
 */

class Solution : Relation {
    func findCelebrity(_ n: Int) -> Int {
        var candidate = 0

        for people in 0..<n {
            if knows(candidate, people) {
                candidate = people
            }
        }

       if isCelebrity(candidate, n) {
           return candidate
       }

        return -1
    }

    func isCelebrity(_ candidate: Int, _ numberOfPeople: Int) -> Bool {
        for people in 0..<numberOfPeople {
            if people == candidate { continue }
            if knows(candidate, people) || !knows(people, candidate) {
                return false
            }
        }
        return true
    }
}