// https://leetcode.com/discuss/interview-question/125011/Snapchat-or-Word-Finder
func wordBreakSimple(_ word: String, _ wordMap: Set<String>, _ memo: inout [String: Int]) -> Int {
   
    if word.isEmpty {
        return 0
    }
    
    if let count = memo[word] {
        return count
    }
    
    var currentCount = Int.min
    
    for prefix in wordMap {
        if word.hasPrefix(prefix) {
            let suffix = String(word.suffix(word.count - prefix.count))
            let count = wordBreakSimple(suffix, wordMap, &memo)
            if count != Int.min {
                currentCount = count + 1
            }
        }
    }
    
    memo[word] = currentCount
    return currentCount
}


func getSimpleWords(_ words: [String]) -> [String] {
    var result = [String]()
    var words = Set(words)
    
    for word in words {
        var memo = [String: Int]()
        words.remove(word)
       
        if wordBreakSimple(word, words, &memo) == Int.min {
           result.append(word)
        }
        
        words.insert(word)
    }
    
    return result
}

let result1 = getSimpleWords(["snap", "snapchat", "chat"])
let result2 = getSimpleWords(["chat", "ever", "snapchat", "snap", "salesperson", "per", "person", "sales", "son", "whatsoever", "whatso"])

print(result1) // [snap, chat]
print(result2) // ["chat", "per", "sales", "snap", "ever", "son", "whatso"]
