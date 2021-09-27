  func minDistance(_ word1: String, _ word2: String) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: word2.count + 1), count: word1.count + 1)
        return minEditDistance(Array(word1), Array(word2), word1.count, word2.count, &memo)
    }
    
    func minEditDistance( _ word1: [Character], 
                         _ word2: [Character], 
                         _ index1: Int,
                         _  index2: Int,
                        _ memo: inout [[Int]]) -> Int {
        if index1 == 0 {
            return index2
        }
        
        if index2 == 0 {
            return index1
        }
        
        if memo[index1][index2] == -1 {
            if word1[index1 - 1] == word2[index2 - 1] {
                memo[index1][index2] = minEditDistance(word1, word2,  index1 - 1, index2 - 1, &memo)
            } else {
                let insertCase = minEditDistance(word1, word2,  index1, index2 - 1, &memo)
                let deleteCase = minEditDistance(word1, word2,  index1 - 1, index2, &memo)
                let replaceCase = minEditDistance(word1, word2,  index1 - 1, index2 - 1, &memo)
                memo[index1][index2] = min(insertCase, deleteCase, replaceCase) + 1
            }
        }
        
        return memo[index1][index2]
    }