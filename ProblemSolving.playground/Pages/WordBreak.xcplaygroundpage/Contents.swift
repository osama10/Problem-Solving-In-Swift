//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

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

    func contains(_ word: String) -> Bool {
        if word.isEmpty { return false }
        var node = root
        for char in word {
            if let nextNode = node.get(char){ node = nextNode }
            else { return false }
        }
        return node.isWord
    }
}

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let trie = Trie()
    wordDict.forEach(trie.insert)
    var cache = [String: Bool]()
    return checkWordBreak(s, trie, &cache)
}



func checkWordBreak(_ word: String, _ trie: Trie, _ cache: inout [String: Bool]) -> Bool {
    if word.isEmpty { return true }
    if let result = cache[word] { return result }

    var prefix = ""

    for char in word {
        prefix.append(char)
        if trie.contains(prefix) && checkWordBreak(String(word.suffix(word.count -  prefix.count)), trie, &cache)  {
            cache[word] = true
            return true
        }
    }
    cache[word] = false
    return false
}

wordBreak("catsandogcat", ["cats","dog","sand","and","cat","an"])
wordBreak("aaaaaaa", ["aaa","aaaa"])


func wordBreakDP(_ s: String, _ wordDict: [String]) -> Bool {
    var cache = [String: Bool]()
    return wordBreakUtil(s, Set(wordDict), &cache)
}

func wordBreakUtil(_ word: String, _ wordDict: Set<String>, _ cache: inout [String: Bool]) -> Bool {
    if let isPrefix = cache[word] { return isPrefix }

    var prefix = ""

    for char in word {
        prefix.append(char)
        if wordDict.contains(prefix) {
            let remaingWord = word.suffix(word.count - prefix.count)
            if remaingWord.isEmpty { return true }

            if wordBreakUtil(String(remaingWord), wordDict, &cache) {
                cache[word] = true
                return true
            }
        }

    }

    cache[word] = false
    return false
}
