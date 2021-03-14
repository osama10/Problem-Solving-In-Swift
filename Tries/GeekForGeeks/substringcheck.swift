/// https://www.geeksforgeeks.org/suffix-tree-application-1-substring-check/

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
        return true
    }

}


func checkForSubString(_ str: String, _ substring: String) -> Bool {
    let trie = Trie()

    for i in 0..<str.count {
        let suffix = String(str.suffix((str.count - i)))
        trie.add(suffix)
    }
    return trie.search(substring)
}

checkForSubString("THIS IS A TEST TEXT$","TEST")
checkForSubString("THIS IS A TEST TEXT$","A")
checkForSubString("THIS IS A TEST TEXT$"," ")
checkForSubString("THIS IS A TEST TEXT$","IS A")
checkForSubString("THIS IS A TEST TEXT$"," IS A ")
checkForSubString("THIS IS A TEST TEXT$","TEST1")
checkForSubString("THIS IS A TEST TEXT$","THIS IS GOOD")
checkForSubString("THIS IS A TEST TEXT$","TES")
checkForSubString("THIS IS A TEST TEXT$","TESA")
checkForSubString("THIS IS A TEST TEXT$","ISB")
