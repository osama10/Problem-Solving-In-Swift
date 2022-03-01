class Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var freqTable = Array(repeating: 0, count: 60)
        var count = 0
        
        for duration in time {
            let remainder = duration % 60
            
            if remainder == 0 {
                count += freqTable[0]
            } else {
                count += freqTable[60 - remainder]
            }
            
            freqTable[remainder] += 1
        }
        
        return count 
    }
}

