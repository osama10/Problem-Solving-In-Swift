func indexPairs(_ text: String, _ words: [String]) -> [[Int]] {
   
    let trie = Trie()
    trie.addWords(words)
   
    let text = Array(text)
    var result = [[Int]]()
    
    for i in 0..<text.count {
        var currentNode = trie.root
        for j in i..<text.count {
            if let next = currentNode.find(text[j]) {
                currentNode = next
                if currentNode.isWord {
                    result.append([i, j])
                }
            } else { break }
        }
    }
    
    return result
}


indexPairs("ababa", ["aba","ab"])
