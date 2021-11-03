class Solution {
   func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    
    guard beginWord.count == endWord.count else { return 0 }
    var queue = [(beginWord, 1)]
    var visited = Set<String>()
    let wordDict = Set(wordList)
    
    while !queue.isEmpty {
        let (word, depth) = queue.removeFirst()
        if word == endWord { return depth }
        let children = getChildren(word, wordDict)
        for child in children {
            if !visited.contains(child) {
                visited.insert(child)
                queue.append((child, depth + 1))
            }
        }
    }
    
    
    return 0
}

func getChildren(_ word: String, _ wordDict: Set<String>) -> [String] {
    let alphabets = "abcdefghijklmnopqrstuvwxyz"
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