class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        var sFreq = Array(repeating: 0, count: 26)
        var tFreq = Array(repeating: 0, count: 26)
        var steps = 0
        
        let characters = "abcdefghijklmnopqrstuvwxyz" 

        for (sChar,tChar) in zip(s,t) {
            let sIndex = getIndex(sChar)
            let tIndex = getIndex(tChar)
            sFreq[sIndex] += 1
            tFreq[tIndex] += 1
        }
        
        
        for char in characters {
            let index = getIndex(char)
            if sFreq[index] > tFreq[index] {
                steps += sFreq[index] - tFreq[index]
            }
        }
        
        return steps
    }
    
    func getIndex(_ char: Character) -> Int {
        Int(String(char.asciiValue!))! - Int(String(Character("a").asciiValue!))!
    }
}