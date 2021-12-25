class Solution {

func kSimilarity(_ s1: String, _ s2: String) -> Int {
    guard s1 != s2 else { return 0 }
    var queue = [s1]
    var seen = Set<String>()
    let target = Array(s2)
    var k = 0
    
    seen.insert(s1)

    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let node = queue.removeFirst()
            if node == s2 { return k }
            let nextNodes = getNeighbors(Array(node), target)
            
            for nextNode in nextNodes {
                if !seen.contains(nextNode) {
                    queue.append(nextNode)
                    seen.insert(nextNode)
                }
            }
        }
        
        k += 1
    }
    
    
    return k
}

func getNeighbors(_ str1: [Character], _ str2: [Character]) -> [String] {
    var index = 0
    var result = [String]()
    
    while str1[index] == str2[index] {
        index += 1
    }
    
    for j in index+1..<str1.count {
        if str1[j] == str2[j] || str1[index] != str2[j] { continue }
        var neighbor = str1
        neighbor.swapAt(index, j)
        result.append(String(neighbor))
    }
    
    return result
}

}