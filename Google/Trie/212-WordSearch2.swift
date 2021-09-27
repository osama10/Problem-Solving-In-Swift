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
        
        current.isWord = true
    }
    
    func addWords(_ words: [String]) {
        for word in words {
            addWord(word)
        }
    }
    
    func hasPrefix(_ prefix: String) -> Bool {
        var current = root
        for char in prefix {
            if let next = current.find(char) {
                current = next
            } else { return false }
        }
        return true
    }
    
    func hasWord(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var current = root
        for char in word {
            if let next = current.find(char) {
                current = next
            } else { return false }
        }
        
        return current.isWord
    }
}

class TrieNode {
    var isWord = false
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



var totalRow = 0
var totalCol = 0
var alreadyFound = Set<String>()

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    var result = [String]()
    var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
   
    let wordDict = Trie()
    wordDict.addWords(words)
    
    totalRow = board.count
    totalCol = board[0].count
    
    for row in 0..<totalRow {
        for col in 0..<totalCol {
            if wordDict.hasPrefix(String(board[row][col])) {
                var word = ""
                findBoggleWords(board, row, col, &word, &visited, &result, wordDict.root)
            }
        }
    }
    return result
}



func findBoggleWords(_ matrix: [[Character]],
                     _ row: Int,
                     _ col: Int,
                     _ word: inout String,
                     _ visited: inout [[Bool]],
                     _ result: inout [String],
                     _ root: TrieNode) {
    
    if row < 0 || col < 0 || row >= totalRow || col >= totalCol || visited[row][col] {
        return
    }
    
    let thisNode = root.find(matrix[row][col])
    if thisNode == nil { return }
    
    word.append(matrix[row][col])
    visited[row][col] = true
    

    if thisNode!.isWord && !alreadyFound.contains(word) {
        result.append(word)
        alreadyFound.insert(word)
    }
    
    findBoggleWords(matrix, row - 1 , col, &word, &visited, &result, thisNode!)
    findBoggleWords(matrix, row + 1, col, &word, &visited, &result, thisNode!)
    findBoggleWords(matrix, row, col - 1, &word, &visited, &result, thisNode!)
    findBoggleWords(matrix, row, col + 1, &word, &visited, &result, thisNode!)
    
    word.removeLast()
    visited[row][col] = false

}
}