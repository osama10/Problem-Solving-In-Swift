class Solution {
    typealias Job = (start: Int, end: Int, profit: Int)
    
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let jobs: [Job] = startTime
        .enumerated()
        .map { (startTime[$0.offset], endTime[$0.offset], profit[$0.offset]) }
        .sorted{ $0.start < $1.start }
        var memo = Array(repeating: -1, count: startTime.count + 1)
        return maxProfit(jobs, 0, &memo)
    }
    
    func maxProfit(_ jobs: [Job], _ index: Int, _ memo: inout[Int]) -> Int {
        if index >= jobs.count {
            return 0
        }
            
        if memo[index] != -1 {
            return memo[index]
        }
        
        let currentJob = jobs[index]
        let nextIndex = findNextJob(jobs, currentJob.end)
        
        
        let profit1 = maxProfit(jobs, index + 1, &memo) 
        let profit2 = maxProfit(jobs, nextIndex, &memo) + currentJob.profit
        
        memo[index] = max(profit1, profit2)
        return memo[index]
    }
    
    func findNextJob(_ jobs: [Job], _ endTime: Int) -> Int {
        var start = 0
        var end = jobs.count - 1
        var nextIndex = jobs.count
        
        while start <= end {
            let mid = (start + end) / 2
            if jobs[mid].start >= endTime {
                nextIndex = mid
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return nextIndex
    }
}