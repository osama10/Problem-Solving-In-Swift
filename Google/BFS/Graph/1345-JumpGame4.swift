class Solution {
    var valueMap = [Int: [Int]]()
    
    func minJumps(_ arr: [Int]) -> Int {
        guard arr.count > 2 else { return arr.count - 1}
        arr.enumerated().forEach { (index, value) in
            valueMap[value, default: [Int]()].append(index)
        }
        
        var queue = [0]
        var visited = Set<Int>()
        visited.insert(0)
        
        var minJumps = 0
       
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                
                if node == arr.count - 1 { return minJumps }
                
                if node != 0 && !visited.contains(node - 1) {
                    queue.append(node - 1)
                    visited.insert(node - 1)
                }
                
                if node != arr.count - 1 && !visited.contains(node + 1) {
                    queue.append(node + 1)
                    visited.insert(node + 1)
                }
                
                if let neighbors = valueMap[arr[node]] {
                    for neighbor in neighbors {
                        
                        if !visited.contains(neighbor) {
                            queue.append(neighbor)
                            visited.insert(neighbor)
                        }
                    }
                }
                
                valueMap[arr[node]] = nil
                
            }
            
            minJumps += 1
        }
        
        return minJumps
    }
    
}