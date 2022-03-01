
class OrderedStream {
    var stream : [String]
    var nextId = 0
    
    init(_ n: Int) {
        stream = Array(repeating: "", count: n)
    }
    
    func insert(_ idKey: Int, _ value: String) -> [String] {
        stream[idKey - 1] = value
        
        var result = [String]()
        let start = nextId
        
        for i in start..<stream.count {
            if !stream[i].isEmpty {
                nextId = i + 1
                result.append(stream[i])
            } else { break }
        }
        
        return result
    }
}