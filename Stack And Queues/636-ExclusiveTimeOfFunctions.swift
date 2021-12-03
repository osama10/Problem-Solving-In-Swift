class Solution {
typealias Task = (id: Int, status: Int, time: Int)

func convertToTask(_ log: [String.SubSequence]) -> Task {
    let status = "start" == log[1] ? 1 : 0
    return Task(Int(log[0])!, status, Int(log[2])!)
}

func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
    let end = 0
    let start = 1
    var totalTime = Array(repeating: 0, count: n)
    
    let logs = logs
        .map { $0.split(separator: ":") }
        .map(convertToTask)
    
    var stack = [logs[0].id]
    var prevTime = logs[0].time
    
    for log in logs[1..<logs.count] {
        let id = log.id, status = log.status, time = log.time
        
        switch status {
        case start:
            if let taskId = stack.last {
                let execTime = time - prevTime - 1
                totalTime[taskId] += execTime
            }
            stack.append(id)
        case end:
            let taskId = stack.removeLast()
            let execTime = time - prevTime + 1
            totalTime[taskId] += execTime
        default:
            break
        }
        
        prevTime = time
    }
    
    return totalTime
}

}
