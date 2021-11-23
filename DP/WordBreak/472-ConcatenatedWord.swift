class Solution {

class TrieNode {
    var key: Character?
    var isWord = false
    var children = [Character: TrieNode]()
    
    func insert(_ char: Character) -> TrieNode {
        if let node = children[char] { return node }
        let node = TrieNode()
        node.key = char
        children[char] = node
        return node
    }
}
    
class Trie {
    var root = TrieNode()

    func addWord(_ word: String) {
        var currNode = root
        
        for char in word {
            currNode = currNode.insert(char)
        }
        
        currNode.isWord = true
    }
    
    func isConcatenated(_ word: [Character], _ start: Int, _ root: TrieNode, _ count: Int) -> Bool {
        
        if word.count == start { return count  > 1 }
        let key = String(word[start..<word.count])
                
        var currNode = root
        
        for index in start..<word.count {
            let char = word[index]
            
            guard let node = currNode.children[char] else {
                return false
            }
            
            if node.isWord {
                if isConcatenated(word, index + 1, root, count + 1) {
                    return true
                }
            }
            
            currNode = node
        }
        
        return false
    }
}

func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
    var result = [String]()
    let trie = Trie()
    
    for word in words {
        if !word.isEmpty {
            trie.addWord(word)
        }
    }
    
    for word in words {
        if !word.isEmpty {
            let wordArr = Array(word)
            if trie.isConcatenated(wordArr, 0,trie.root, 0) {
                result.append(word)
            }
        }
    }
    
    return result
}
}
