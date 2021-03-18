func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var cache = [String: Bool]()
    return wordBreakUtil(s, Set(wordDict), &cache)
}

func wordBreakUtil(_ word: String, _ wordDict: Set<String>, _ cache: inout [String: Bool]) -> Bool {
    if let isPrefix = cache[word] { return isPrefix }

    var prefix = ""

    for char in word {
        prefix.append(char)
        if wordDict.contains(prefix) {
            let remaingWord = word.suffix(word.count - prefix.count)
            if remaingWord.isEmpty { return true }

            if wordBreakUtil(String(remaingWord), wordDict, &cache) {
                cache[word] = true
                return true
            }
        }

    }

    cache[word] = false
    return false
}
