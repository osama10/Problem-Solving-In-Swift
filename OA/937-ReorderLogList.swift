class Solution {
    struct Logs {
        enum LogsType {
            case letter
            case digit
        }
        let id: String
        let values: String
        let logsType: LogsType
        let origin: String
        
        init(_ str: String) {
            let index = str.firstIndex { $0 == " " }
            origin = str
            id = String(str.prefix(upTo: index!))
            values = String(str.suffix(from: index!))
            logsType = (Int(String(values.last!)) != nil) ? .digit : .letter
        }
    }
    
    func reorderLogFiles(_ logs: [String]) -> [String] {
        let logs = logs.map(Logs.init)
        var letterLogs = logs.filter { $0.logsType == .letter }
        let digitLogs = logs.filter { $0.logsType == .digit }
        
        letterLogs.sort {
			$0.values == $1.values ? $0.id < $1.id : $0.values < $1.values
        }
        
        return letterLogs.map { $0.origin } + digitLogs.map { $0.origin }
    }
}