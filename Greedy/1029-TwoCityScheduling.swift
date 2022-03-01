class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let costs = costs.sorted { ($0[0] - $0[1]) < ($1[0] - $1[1]) }
        let n = costs.count
       
        var cost1 = 0
        
        for i in 0..<n {
            cost1 += (i < n/2) ? costs[i][0] : costs[i][1]
        }
       
        return cost1
        
    }
}