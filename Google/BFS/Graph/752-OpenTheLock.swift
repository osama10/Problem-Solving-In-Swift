class Solution {
func openLock(_ deadends: [String], _ target: String) -> Int {
    let start = "0000"
    var visited = Set(deadends)
    guard !visited.contains(start)
            && !visited.contains(target) else { return -1 }
    guard target != start else { return  0 }
    visited.insert(start)
    var queue = [start]
    var turns = 0
    
    while !queue.isEmpty {
        let count = queue.count - 1
        
        for _ in 0...count {
            let curr = queue.removeFirst()
            
            if curr == target {
                return turns
            }
            
            for i in 0...3 {
                let neighbors = getNeighbor(curr, i)
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        visited.insert(neighbor)
                        queue.append(neighbor)
                    }
                }
            }
        }
        
        turns += 1
    }
    
    return -1
}


func getNeighbor(_ node: String, _ index: Int) -> [String] {
    var node = Array(node)
    let (posNum, negNum) = getNextBits(Int(String(node[index]))!)
    
    node[index] = posNum
    let child1 = String(node)
    
    node[index] = negNum
    let child2 = String(node)
    
    return [child1, child2]
}

func getNextBits(_ currNum: Int) -> (pos: Character, neg: Character) {
    if currNum == 0 {
       return ("1", "9")
    } else if currNum == 9 {
        return ("0", "8")
    } else {
        return (Character("\(currNum + 1)"), Character("\(currNum - 1)"))
    }
}

}