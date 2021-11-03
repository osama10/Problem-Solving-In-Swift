class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sequence = Array(s)
        let target = Array(t)
        
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