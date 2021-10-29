func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    let word = s
    let wordDict = Set<String>(wordDict)
    return findAllWords(word, wordDict)
}

func findAllWords(_ word: String, _ wordDict: Set<String>) -> [String] {
    
    if word.isEmpty {
        return [""]
    }
    
    if let alreadyFound = wordMap[word] {
        return alreadyFound
    }
    
    var result = [String]()
   
    for prefix in wordDict {
        if word.hasPrefix(prefix) {
            let remaining = word.suffix(word.count - prefix.count)
            let subWords = findAllWords(String(remaining), wordDict)
            for subWord in subWords {
                if subWord.isEmpty {
                    result.append(word)
                } else {
                    result.append(prefix + " " + subWord)
                }
            }
        }
    }
    
    wordMap[word] = result
    return result
}

wordBreak("catsanddog", ["cat","cats","and","sand","dog"])
