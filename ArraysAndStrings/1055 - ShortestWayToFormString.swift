class Solution {
    func shortestWay(_ source: String, _ target: String) -> Int {
        var targetLength = target.count
        var seqCount = 0
        var targetPtr = 0
        
        var source = Array(source)
        var target = Array(target)
        
        while targetLength > 0 {
            var sourcePtr = 0
            var matchedCharCount = 0
            
            while sourcePtr < source.count && targetPtr < target.count {
                if source[sourcePtr] == target[targetPtr] {
                    targetPtr += 1
                    matchedCharCount += 1
                }
                
                sourcePtr += 1
            }
            
            if matchedCharCount == 0 {
                return -1
            }
            
            targetLength -= matchedCharCount
            seqCount += 1
        }
        
        return seqCount
    }
}