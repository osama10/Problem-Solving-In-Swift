class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        return s == goal ? equalCase(s, goal) : notEqualCase(Array(s), Array(goal))
    }
    
    func equalCase(_ str1: String, _ str2: String) -> Bool {
        var charFreqTable = Array(repeating: 0, count: 26)
        
        for (char1, char2) in zip(str1, str2) {
            let index = getIndex(char1)
            charFreqTable[index] += 1
        }
        
        for count in charFreqTable {
            if count > 1 {
                return true
            }
        }
        
        return false
    }
    
    func notEqualCase(_ str1: [Character], _ str2: [Character]) -> Bool {
        var first = -1
        var second = -1

        for (index, (char1, char2)) in zip(str1, str2).enumerated() {
            if char1 != char2 {
                if first == -1 {
                    first = index
                } else if second == -1 {
                    second = index
                } else {
                    return false
                }
            }
        }

        return second != -1
        && str1[first] == str2[second]
        && str1[second] == str2[first]
    }

   func getIndex(_ char: Character) -> Int {
        Int(String(char.asciiValue!))! - Int(String(Character("a").asciiValue!))!
    }

}