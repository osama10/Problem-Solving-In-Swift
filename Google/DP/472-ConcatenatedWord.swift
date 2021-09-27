class Solution {
  func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
    var wordDict = Set(words)
    
    var result = [String]()
    
    for word in words {
        var memo = [String: Bool]()
        wordDict.remove(word)
        if checkForConcatenation(word, wordDict, &memo) {
            result.append(word)
        }
        wordDict.insert(word)
    }
    
    return result
}

func checkForConcatenation(_ word: String, _ wordDict: Set<String>, _ memo: inout [String: Bool]) -> Bool {
    
    if let result = memo[word] { return result }
    
    var newWord = ""
    
    for char in word {
        newWord.append(char)
        if wordDict.contains(newWord) {
            let remainWord = word.suffix(word.count - newWord.count)
            if remainWord.isEmpty { return true }
            if checkForConcatenation(String(remainWord), wordDict, &memo) {
                memo[word] = true
                return true
            }
        }
    }
    
    memo[word] = false
    return false
}
}