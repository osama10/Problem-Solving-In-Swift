class Solution {
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var graph = [Int: [Int]]()
        
        for employee in 0..<n {
            let boss = manager[employee]
            if boss != -1 {
                graph[boss, default: [Int]()].append(employee)
            }
        }
        
        var queue = [(node: headID, time: 0)]
        var maxTime = Int.min
        
        while !queue.isEmpty {
            let (boss, time) = queue.removeFirst()
            
            if maxTime < time {
                maxTime = time
            }
            
            for child in graph[boss, default: [Int]()] {
                queue.append((child, time + informTime[boss]))
            }
            
        }
        
        return maxTime
    }
}