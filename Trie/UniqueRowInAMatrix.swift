import Foundation
/// https://practice.geeksforgeeks.org/problems/unique-rows-in-boolean-matrix/1

class TrieNode {

    var value: Int?
    var children = [Int: TrieNode]()
    var isRow = false

    init(_ value: Int? = nil) { self.value = value }

    func create(_ value: Int) -> TrieNode {
        if let node = children[value] { return node }
        let childNode = TrieNode(value)
        children[value] = childNode
        return childNode
    }

    func getChild(_ value: Int) -> TrieNode? { children[value] }

}

class Trie {
    var root = TrieNode()

    func add( _ row: [Int]) {
        if row.isEmpty { return }
        var node = root
        row.forEach { node = node.create($0) }
        node.isRow = true
    }

    func search(_ row: [Int]) -> Bool {
        var node = root
        for value in row {
            if let nextNode = node.getChild(value) { node = nextNode }
            else { return false }
        }
        return node.isRow
    }
}


func uniqueRow(_ matrix: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    let trie = Trie()
    for row in matrix {
        if !trie.search(row) { result.append(row) }
        trie.add(row)
    }

    return result
}


uniqueRow([[1,1,0,1],[1, 0, 0, 1],[1, 1, 0, 1]])

