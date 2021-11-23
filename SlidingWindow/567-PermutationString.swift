class Solution {
// Time Complexity O(P + T)
// 
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    let pattern = Array(s1)
    let targetStr = Array(s2)
    var patternFreqTable = Array(repeating: 0, count: 26)
    var targetFreqTable = Array(repeating: 0, count: 26)

    pattern.forEach { char in
        let index = getIndex(char)
        patternFreqTable[index] += 1
    }

    var start = 0
    
    for (end, char) in targetStr.enumerated() {
        let index = getIndex(char)
        targetFreqTable[index] += 1
        
        if end >= pattern.count {
            let indexToDelete = getIndex(targetStr[start])
            start += 1
            targetFreqTable[indexToDelete] -= 1
        }
        
        if targetFreqTable.elementsEqual(patternFreqTable) {
            return true
        }
    }
    
    return false
}


func getIndex(_ char: Character) -> Int {
    Int(char.asciiValue! - Character("a").asciiValue!)
}
}
