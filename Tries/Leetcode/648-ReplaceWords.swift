
import Foundation

/// 648
func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
    var splitSentence = sentence
        .split(separator: " ")
        .map(String.init)

    for root in dictionary {
        for index in 0..<splitSentence.count {
            if splitSentence[index].hasPrefix(root) { splitSentence[index] = root }
        }
    }

    return splitSentence
        .joined(separator: " ")
}

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

    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        if word.isEmpty { return }
        var node = root
        for char in word { node = node.addChild(char) }
        node.isWord = true
    }

    func searchRoot(_ successor: String) -> String? {
        if successor.isEmpty { return nil }
        var node = root

        var result = ""

        for char in successor {
            if let nextNode = node.getChild(char){
                result.append(nextNode.value!)
                if nextNode.isWord { return result }
                node = nextNode
            } else { return nil }
        }

        return nil
    }
}


func replaceWordsTrie(_ dictionary: [String], _ sentence: String) -> String {
    let trie = Trie()
    dictionary.forEach(trie.insert)

    var words = sentence
        .split(separator: " ")
        .map(String.init)

    for index in 0..<words.count { if let root = trie.searchRoot(words[index]) { words[index] = root } }

    return words
        .joined(separator: " ")

}

//replaceWords(["a", "aa", "aaa", "aaaa"], "a aa a aaaa aaa aaa aaa aaaaaa bbb baba ababa") == "a a a a a a a a bbb baba a"
//replaceWords(["a","b","c"], "aadsfasf absbs bbab cadsfafs") == "a a b c"
//replaceWords(["catt","cat","bat","rat"], "the cattle was rattled by the battery") == "the cat was rat by the bat"
//replaceWords(["ac","ab"], "it is abnormal that this solution is accepted") == "it is ab that this solution is ac"
//
//
//replaceWordsTrie(["a", "aa", "aaa", "aaaa"], "a aa a aaaa aaa aaa aaa aaaaaa bbb baba ababa") == "a a a a a a a a bbb baba a"
//replaceWordsTrie(["a","b","c"], "aadsfasf absbs bbab cadsfafs") == "a a b c"
//replaceWordsTrie(["catt","cat","bat","rat"], "the cattle was rattled by the battery") == "the cat was rat by the bat"
//replaceWordsTrie(["ac","ab"], "it is abnormal that this solution is accepted") == "it is ab that this solution is ac"

