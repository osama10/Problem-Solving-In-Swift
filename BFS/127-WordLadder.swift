class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var queue = [beginWord]
        var words = 1
        var visited = Set<String>()
        let wordList = Set(wordList)
        
        visited.insert(beginWord)
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let word = queue.removeFirst()
                
                if word == endWord {
                    return words
                }
                
                let nextPossibleWords = getChildren(word, wordList)
                
                for nextWord in nextPossibleWords {
                    if !visited.contains(nextWord) {
                        visited.insert(nextWord)
                        queue.append(nextWord)
                    }
                }
            }
            
            words += 1
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
