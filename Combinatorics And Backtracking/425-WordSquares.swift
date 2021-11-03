class Solution {
  class Trie {
   
    class TrieNode {
        var key: Character?
        var children = [Character: TrieNode]()
        var words = Set<String>()
    }
    
    let root = TrieNode()
    
    init(words: [String]) {
        words.forEach { insert($0) }
    }
    
    func insert(_ word: String) {
        var curr = root
        
        for char in word {
            if let next = curr.children[char] {
                curr = next
            } else {
                let newNode = TrieNode()
                newNode.key = char
                curr.children[char] = newNode
                curr = newNode
            }
            
            curr.words.insert(word)
        }
    }
    
    func getWords(_ prefix: String) -> Set<String> {
        var curr = root
        
        for char in prefix {
            if let next = curr.children[char] {
                curr = next
            } else { return [] }
        }
        
        return curr.words
    }
}

func wordSquares(_ words: [String]) -> [[String]] {
    var results = [[String]]()
    let maxLength = words[0].count
    let trie = Trie(words: words)
    
    func backtrack(_ currentCombination: inout [[Character]], _ step: Int) {
        if maxLength == step {
            results.append(currentCombination.map { String($0)} )
        } else {
            var prefix = ""
            
            for row in 0..<step {
                prefix.append(currentCombination[row][step])
            }
            
            let possibleRows = trie.getWords(prefix)
            
            for nextWord in possibleRows {
                currentCombination.append(Array(nextWord))
                backtrack(&currentCombination, step + 1)
                currentCombination.removeLast()
            }
        }
    }
    
    for word in words {
        var currCombination = [Array(word)]
        backtrack(&currCombination, 1)
    }
    
    print(results)
    return results
}

}