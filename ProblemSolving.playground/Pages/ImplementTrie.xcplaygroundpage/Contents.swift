import Foundation

/// 208
class TrieNode {

    var value: Character?
    var children = [Character: TrieNode]()
    var isWord = false

    init(_ value: Character? = nil) { self.value = value }

    func addChild(_ char: Character) -> TrieNode {
        if let node = children[char] { return node }
        children[char] = TrieNode(char)
        return children[char]!
    }

    func getChild( _ char: Character) -> TrieNode? { children[char] }
}

class Trie {

    var root = TrieNode()

    /** Initialize your data structure here. */
    init() {

    }

    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        if word.isEmpty { return }
        var node = root
        for char in word { node = node.addChild(char) }
        node.isWord = true
    }

    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        guard !word.isEmpty, let lastNode = findLastNode(word) else { return false }
        return lastNode.isWord
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func search(_ word: String) -> Bool {
            guard !word.isEmpty, let lastNode = findLastNode(word) else { return false }
            return lastNode.isWord
    }

    private func findLastNode(_ word: String) -> TrieNode? {
        if word.isEmpty { return nil }
        var node = root
        for char in word {
            if let nextNode = node.getChild(char) { node = nextNode }
            else { return nil }
        }

        return node
    }
}
