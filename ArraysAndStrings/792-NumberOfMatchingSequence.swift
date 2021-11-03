class Solution {
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var count = 0
        var s = Array(s)
        var added = Set<String>()
        var discarded = Set<String>()
        
        for word in words {
            if added.contains(word) {
                count += 1 
                continue
            }
            
            if discarded.contains(word) {
                continue 
            }
            
            if isSubsequence(Array(word), s) {
                count += 1
                added.insert(word)
            } else {
                discarded.insert(word)
            }
        }
        
        return count 
    }
    
   func isSubsequence(_ sequence: [Character], _ target: [Character]) -> Bool {
        var seqPtr = 0
        var targetPtr = 0
        
        
        while seqPtr < sequence.count && targetPtr < target.count {
            if sequence[seqPtr] == target[targetPtr] {
                seqPtr += 1
            }
            
            
            targetPtr += 1
        }
        
        return seqPtr == sequence.count
    }
    
    
}