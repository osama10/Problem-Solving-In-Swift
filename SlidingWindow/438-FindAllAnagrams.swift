class Solution {
func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var patternCount = Array(repeating: 0, count: 26)
    var targetCount =  Array(repeating: 0, count: 26)
    var start = 0
    let s = Array(s)
    var result = [Int]()
    
    for char in p {
        let index = getIndex(char)
        patternCount[index] += 1
    }
    
    for (end, char) in s.enumerated() {
        let index = getIndex(char)
        targetCount[index] += 1
        
        if end >= p.count {
            let indexToRemoveCount = getIndex(s[start])
            targetCount[indexToRemoveCount] -= 1
            start += 1
        }
        
        if targetCount.elementsEqual(patternCount) {
            result.append(start)
        }
    }
    
    return result

}

func getIndex(_ char: Character) -> Int {
    Int(char.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
}
}