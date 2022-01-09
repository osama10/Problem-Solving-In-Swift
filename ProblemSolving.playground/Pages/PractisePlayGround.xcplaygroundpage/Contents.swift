//typealias Data = (id: String, letterLogs: String, digitLogs: String)
//
//func reorderLogFiles(_ logs: [String]) -> [String] {
//    var reorderedLogs = [Data]()
//
//    for log in logs {
//        let splittedData = log
//            .split(separator: " ")
//            .map(String.init)
//
//        var letters = [String]()
//        var numbers = [String]()
//
//        for data in splittedData[1..<splittedData.count] {
//            Int(data) == nil ? letters.append(data) : numbers.append(data)
//        }
//        let id = splittedData[0]
//        let data = (id, letters.sorted().joined(separator: " "), numbers.joined(separator: " "))
//        reorderedLogs.append(data)
//    }
//
//    reorderedLogs.sorted { $0.letterLogs < $1.letterLogs
//        || $0.letterLogs == $1.letterLogs && $0.id < $1.id}
//
//
//    return reorderedLogs.map { $0.id + " " + $0.letterLogs + " " + digitLogs}
//}

func gridCluster(grid: [[Int]]) -> Int {
    var ans = 0
    var arr = [Int]()
    
    for row in 0..<grid.count {
        let sum = grid[row].reduce(0, +)
        if sum != 0 {
            arr.append(sum)
        }
    }
    
    for i in 0..<arr.count-1 {
        ans += arr[i] * arr[i + 1]
    }
    
    return ans
}

gridCluster(grid:  [[1, 1, 1], [0, 1, 0], [0, 0, 0],[1,1, 0]])

[[1, 1, 1],
 [0, 1, 0],
 [0, 0, 0],
 [1, 1, 0]]
