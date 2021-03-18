import Foundation

/// https://www.geeksforgeeks.org/longest-prefix-matching-a-trie-based-solution-in-java/?ref=rp

class TrieNode {
    var val: Character?
    var isWord = false
    var children = [Character: TrieNode]()

    init(_ val: Character? = nil) { self.val = val }

    func create(_ char: Character) -> TrieNode {
        if let node = children[char] { return node }
        let child =  TrieNode(char)
        children[char] = child
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
}

func getMatchingPrefix(_ dict: [String], _ word: String) -> String {
    let trie = Trie()
    dict.forEach(trie.insert)

    var node = trie.root
    var result = ""
    var prevPrefix = ""

    for char in word {
        if node.children[char] == nil { break }
        node = node.children[char]!
        result.append(char)
        if node.isWord { prevPrefix = result }
    }

    return prevPrefix
}

getMatchingPrefix(["are", "area", "base", "cat", "cater", "children", "basement"], "caterer")
getMatchingPrefix(["are", "area", "base", "cat", "cater", "children", "basement"], "basement")
getMatchingPrefix(["are", "area", "base", "cat", "cater", "children", "basement"], "basemexy")
getMatchingPrefix(["are", "area", "base", "cat", "cater", "children", "basement"], "child")
getMatchingPrefix(["are", "area", "base", "cat", "cater", "children", "basement"], "are")
getMatchingPrefix(["are", "area", "base", "cat", "cater", "children", "basement"], "arex")
