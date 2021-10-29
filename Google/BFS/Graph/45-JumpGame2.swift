class Solution {
    var memo = [Int: Int]()
    func jump(_ nums: [Int]) -> Int {
        var queue = [0]
        var jumps = 0
        var visited = Set<Int>()
        visited.insert(0)
        
        let destination = nums.count - 1
        
        while !queue.isEmpty {
            let count = queue.count 
            
            for _ in 0..<count {
                let top = queue.removeFirst()
                           
                if top == destination {
                    return jumps
                }
               
                if nums[top] == 0  { continue }
    
                for jumpSize in 1...nums[top] {
                    let nextPos = min(destination, top + jumpSize)
                    
                    if !visited.contains(nextPos) {
                        visited.insert(nextPos)
                        queue.append(nextPos)
                    }
                }
            }
            
            jumps += 1
        }
        
        return jumps
    }
    
}