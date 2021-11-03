class Solution {
    var memo = [String: Int]()
    
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        minWeightLeft(stones, 0, 0, 0)
    }
    
    func minWeightLeft(_ stones: [Int], _ index: Int, _ subset1: Int, _ subset2: Int) -> Int {
        if index == stones.count {
            return abs(subset1 - subset2)
        }
        
        let key = "\(index)-\(subset1)"
        
        if memo[key] == nil {
            let val = stones[index]
            let diffWithI = minWeightLeft(stones, index + 1, subset1 + val, subset2)
            let diffWithoutI = minWeightLeft(stones, index + 1, subset1, subset2 + val) 
            memo[key] = min(diffWithI, diffWithoutI)
        }
        
        
        return memo[key]!
    }
}