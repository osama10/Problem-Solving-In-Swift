class Solution {

class TrieNode {
    var key: Character?
    var isWord = false
    var children = [Character: TrieNode]()
    var word = ""
    
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
        currNode.word = word
    }
    
    func isConcatenated(_ word: [Character], _ start: Int, _ root: TrieNode, _ count: Int, _ temp: inout [String]) -> Bool {
        
        if word.count == start { return temp.count  > 1 }
                       
        var currNode = root
        
        for index in start..<word.count {
            let char = word[index]
            
            guard let node = currNode.children[char] else {
                return false
            }
            
            if node.isWord {
                temp.append(node.word)
                
                if isConcatenated(word, index + 1, root, count + 1, &temp) {
                    return true
                }
                
                temp.removeLast()
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
            var temp = [String]()
            if trie.isConcatenated(wordArr, 0,trie.root, 0, &temp) {
                result.append(word)
                print(temp.joined(separator: " "))
            }
        }
    }
    
    return result
}
}
