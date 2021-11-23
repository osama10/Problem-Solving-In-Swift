class TimeMap {
    var valueMap = [Int: String]()
    var timestampMap = [String: [Int]]()
   
    init() {
        
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        timestampMap[key, default: []].append(timestamp)
        valueMap[timestamp] = value
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let timestamps = timestampMap[key], !timestamps.isEmpty else { return "" }
        guard let first = timestamps.first, timestamp >= first else { return "" }
        let timestamp = binsearch(timestamps, timestamp)
        return valueMap[timestamp] ?? ""
    }
    
    func binsearch(_ timestamps: [Int], _ target: Int) -> Int {
        var left = 0
        var right = timestamps.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            if timestamps[mid] == target {
                return target
            } else if timestamps[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
         return left == 0 ? timestamps[0] : timestamps[left - 1]
    }
    
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */