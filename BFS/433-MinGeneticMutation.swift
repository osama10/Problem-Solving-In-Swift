class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
    guard !bank.isEmpty else { return -1 }
    
    var queue = [(start, 0)]
    var visited = Set<String>()
    let bankDict = Set(bank)
    
    while !queue.isEmpty {
        let (word, depth) = queue.removeFirst()
        if word == end { return depth }
        let children = getChildren(word, bankDict)
        for child in children {
            if !visited.contains(child) {
                visited.insert(child)
                queue.append((child, depth + 1))
            }
        }
    }
    
    
    return -1
}

func getChildren(_ word: String, _ wordDict: Set<String>) -> [String] {
    let alphabets = "ACGT"
    var word = Array(word)
    var result = [String]()
    
    for char in alphabets {
        for (index, origChar) in word.enumerated() {
            word[index] = char
            if origChar != char {
                let newWord = String(word)
                if wordDict.contains(newWord) {
                    result.append(newWord)
                }
                word[index] = origChar
            }
            
        }
    }
    
    return result
}


}