import Foundation

// https://www.geeksforgeeks.org/find-all-shortest-unique-prefixes-to-represent-each-word-in-a-given-list/?ref=rp

class TrieNode {
    var val: Character?
    var isWord = false
    var children = [Character: TrieNode]()
    var visitCount = 0

    init(_ val: Character? = nil) { self.val = val }

    func create(_ char: Character) -> TrieNode {
        if let node = children[char] {
            node.visitCount += 1
            return node
        }
        let child =  TrieNode(char)
        children[char] = child
        child.visitCount += 1
        return child
    }

    func get(_ char: Character) -> TrieNode? { children[char] }
}

class Trie {
    var root = TrieNode()

    func insert( _ word: String) {
        if word.isEmpty { return }
        var node = root
        word.forEach { node = node.create($0) }
        node.isWord = true
    }

    func searchUniquePrefix( _ word: String) -> String {
        if word.isEmpty { return "" }
        var prefix = ""
        var node = root

        for char in word {
            if let nextNode = node.children[char] {
                prefix.append(char)
                if nextNode.visitCount == 1 { return prefix }
                node = nextNode
            }else { return "" }
        }
        return prefix
    }
}

func findPrefixes(_ words: [String]) -> [String] {
    let trie = Trie()
    words.forEach(trie.insert)
    var prefixes = [String]()
    words.forEach { prefixes.append(trie.searchUniquePrefix($0)) }
    return prefixes
}

findPrefixes(["zebra", "dog", "duck", "dove"])

