
class Trie {
    let root = TrieNode()
    
    func addWord(_ word: String) {
        var current = root
        
        for char in word {
            if let next = current.find(char) {
                current = next
            } else {
                let next = current.addChild(char)
                current = next
            }
        }
        
        current.isWord = true
    }
    
    func addWords(_ words: [String]) {
        for word in words {
            addWord(word)
        }
    }
    
    func hasPrefix(_ prefix: String) -> Bool {
        var current = root
        for char in prefix {
            if let next = current.find(char) {
                current = next
            } else { return false }
        }
        return true
    }
    
    func hasWord(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var current = root
        for char in word {
            if let next = current.find(char) {
                current = next
            } else { return false }
        }
        
        return current.isWord
    }
}

class TrieNode {
    var isWord = false
    var key: Character?
    var children = [Character: TrieNode]()
    
    func addChild(_ child: Character) -> TrieNode {
        if let childNode = children[child] { return childNode }
        let node = TrieNode()
        node.key = child
        children[child] = node
        return node
    }
    
    func find(_ child: Character) -> TrieNode? { children[child] }
}