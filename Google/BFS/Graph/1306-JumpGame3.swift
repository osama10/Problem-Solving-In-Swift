class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var queue = [start]
        var visited = Set<Int>()
        
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            
            if arr[curr] == 0 { return true }
            
            visited.insert(curr)
            
            let nextIndex1 = curr + arr[curr]
            let nextIndex2 = curr - arr[curr]
            
            if nextIndex1 >= 0 
            && nextIndex1 < arr.count 
            && !visited.contains(nextIndex1) {
                queue.append(nextIndex1)
            }
            
            if nextIndex2 >= 0 
            && nextIndex2 < arr.count 
            && !visited.contains(nextIndex2) {
                queue.append(nextIndex2)
            }
        }
        
        return false

    }
}