class Solution {
  
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
        
        current.word = word
    }
    
    func addWords(_ words: [String]) {
        for word in words {
            addWord(word)
        }
    }
    
}

class TrieNode {
    var word = ""
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

var root = Trie()
var allWords = [String]()
var foundWords = Set<String>()

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    root.addWords(words)
    
    var visited = Array(repeating:
                            Array(repeating: false, count: board[0].count),
                        count: board.count)
    
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            if root.root.find(board[row][col]) != nil {
                findWord(board, row, col, &visited, root.root)
            }
        }
    }
    
    return allWords
}

func findWord(_ board: [[Character]],
              _ row: Int,
              _ col: Int,
              _ visited: inout [[Bool]],
              _ root: TrieNode) {
    
    if row < 0
        || row >= board.count
        || col < 0
        || col >= board[0].count
        || visited[row][col] { return }
    
    guard let thisNode = root.find(board[row][col]) else { return }
    
    visited[row][col] = true
    
    if !thisNode.word.isEmpty && !foundWords.contains(thisNode.word) {
        allWords.append(thisNode.word)
        foundWords.insert(thisNode.word)
    }
    
    findWord(board, row + 1, col, &visited, thisNode)
    findWord(board, row - 1, col,  &visited, thisNode)
    findWord(board, row , col + 1, &visited, thisNode)
    findWord(board, row, col - 1, &visited, thisNode)

    visited[row][col] = false
    
}

}
