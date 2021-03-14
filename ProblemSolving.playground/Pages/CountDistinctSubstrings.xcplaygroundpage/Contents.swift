import Foundation

class TrieNode {
    var value: Character?
    var children = [Character: TrieNode]()
    var word = false

    init(_ value: Character? = nil) { self.value = value }

    func create(_ value: Character) -> TrieNode {
        if let node = children[value] { return node }
        let childNode = TrieNode(value)
        children[value] = childNode
        return childNode
    }

    func getChild(_ value: Character) -> TrieNode? { children[value] }

}

class Trie {
    var root = TrieNode()

    func add( _ word: String) {
        if word.isEmpty { return }
        var node = root
        word.forEach { node = node.create($0) }
        node.word = true
    }

    func search(_ word: String) -> Bool {
        var node = root
        for char in word {
            if let nextNode = node.getChild(char) { node = nextNode }
            else { return false }
        }
        return false
    }
}

func countDistinctSubstring(_ str: String) -> Int {
    let trie = Trie()
    for i in 0..<str.count {
        let suffix = String(str.suffix((str.count - i)))
        print(suffix)
        trie.add(suffix)
    }
    var totalNodes = 0
    countNodes(trie.root, &totalNodes)
    return totalNodes + 1
}

func countNodes(_ root: TrieNode, _ totalNodes: inout Int) {
    if root.children.isEmpty { return  }
    totalNodes +=  root.children.count
    for child in root.children.values { countNodes(child, &totalNodes) }
}

countDistinctSubstring("ab")
countDistinctSubstring("ababa")
countDistinctSubstring("banana")


