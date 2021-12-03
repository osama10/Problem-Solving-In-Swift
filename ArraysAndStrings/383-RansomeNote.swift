class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomLetterCount = ransomNote.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var magazineLetterCount = magazine.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        
        for (key, value) in ransomLetterCount {
            if let parentValue = magazineLetterCount[key]{
                if parentValue < value { return false }
            } else {
                return false
            }
        }

        return true
    }
    

}