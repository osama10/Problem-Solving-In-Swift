enum FileType {
    case directory
    case file(content: String)
}

class TrieNode {
    var key: String?
    var children = [String: TrieNode]()
    var type: FileType
    
    init(_ type: FileType = .directory) {
        self.type = type
    }
    
    func addChild(_ child: String, _ type: FileType = .directory) -> TrieNode {
        if let childNode = children[child] { return childNode }
        let node = TrieNode(type)
        node.key = child
        children[child] = node
        return node
    }
    
    func getChild(_ child: String) -> TrieNode? { children[child] }
}

class Trie {
    var root = TrieNode()
    
    init() {
        root.addChild("/")
    }
    
    func addPath(_ path: String, _ type: FileType) {
        guard path != "/",
              var curr = root.getChild("/")
        else { return }
       
        let fileNames = path
            .split(separator: "/")
            .map(String.init)
        
        for fileName in fileNames {
            curr = curr.addChild(fileName)
        }
        
        if case let .file(newContent) = type {
            if case let .file(storedConent) = curr.type {
                curr.type = .file(content: storedConent + newContent)
            } else {
                curr.type = type
            }
        }
        
    }
    
    func mkdir(_ path: String) {
        addPath(path, .directory)
    }
    
    func addContentsToFile(_ path: String, _ content: String) {
        addPath(path, .file(content: content))
    }
    
    func searchPath(_ path: String) -> TrieNode? {
        guard var curr = root.getChild("/") else { return nil }
       
        let fileNames = path
            .split(separator: "/")
            .map(String.init)
        
        for fileName in fileNames {
            guard let nextNode = curr.getChild(fileName) else { return nil }
            curr = nextNode
        }
        
        return curr
    }
    
    func ls(_ path: String) -> [String] {
        guard let node = searchPath(path) else { return [] }
        
        switch node.type {
        case .file(_): return [node.key ?? ""]
        case .directory: return node.children.keys.sorted()
        }
    }
    
    func readContentFromFile(_ path: String) -> String {
        guard let node = searchPath(path) else { return "" }
        
        if case let .file(content) = node.type {
            return content
        }
        
        return ""
    }
}

class FileSystem {
    var trie = Trie()
   
    init() {
        
    }
    
    func ls(_ path: String) -> [String] {
        trie.ls(path)
    }
    
    func mkdir(_ path: String) {
        trie.mkdir(path)
    }
    
    func addContentToFile(_ filePath: String, _ content: String) {
        trie.addContentsToFile(filePath, content)
    }
    
    func readContentFromFile(_ filePath: String) -> String {
        trie.readContentFromFile(filePath)
    }
}

let fileSystem = FileSystem()
fileSystem.ls("/")
fileSystem.mkdir("/a/b/c")
fileSystem.addContentToFile("/a/b/c/d", "hello")
fileSystem.ls("/")
fileSystem.readContentFromFile("a/b/c/d")
fileSystem.addContentToFile("/a/b/c/d", " hello hello")
fileSystem.readContentFromFile("a/b/c/d")

fileSystem.addContentToFile("/f", "osama")
fileSystem.ls("/a/b/c/d")
fileSystem.readContentFromFile("/sdf")

func getListOfBuyableItems(_ menu: [String: Double], _ budget: Double) -> [[String]] {
    var allList = [[String]]()
    var list = [String]()
    let menu = menu.map{ (item: $0.key, cost: $0.value) }
    getList(menu, 0, budget, &list, &allList)
    return allList
}

func getList(_ menu: [(item: String, cost: Double)],_ start: Int, _ budget: Double, _ list: inout [String], _ allList: inout [[String]])  {
    
    if budget == 0 {
        allList.append(list)
    } else {
        for index in start...menu.count-1 {
            let item = menu[index]
            if budget >= item.cost {
                list.append(item.item)
                getList(menu, index, budget - item.cost, &list, &allList)
                list.removeLast()
            }
        }
    }
}

var menu = ["Fruit": 2.15,
            "Fries": 2.75,
            "Salad": 3.35,
            "Wings": 3.55,
            "Mozzarella": 4.20,
            "Plate": 5.80]

getListOfBuyableItems(menu, 4.30) // [["Fruit", "Fruit"]]
getListOfBuyableItems(menu, 5.50) // [["Fruit", "Salad"], ["Fries", "Fries"]]
getListOfBuyableItems(menu, 2.15) // [["Fruit"]]




//class TrieNode {
//
//    var key: Character?
//    var isWord = false
//    var word = ""
//    var children = [Character: TrieNode]()
//
//    func insert(_ char: Character) -> TrieNode {
//        if let node = children[char] { return node }
//        let node = TrieNode()
//        node.key = char
//        children[char] = node
//        return node
//    }
//}
//
//class Trie {
//    var root = TrieNode()
//
//    func addWord(_ word: String) {
//        var currNode = root
//
//        for char in word {
//            currNode = currNode.insert(char)
//        }
//
//        currNode.isWord = true
//        currNode.word = word
//    }
//
//    func isConcatenated(_ word: [Character], _ index: Int, _ root: TrieNode) -> [[String]]? {
//        print(index)
//
//        if word.count == index {
//            print("last")
//            return [[]]
//        }
//
//        var curr = root
//        var results = [[String]]()
//
//        for i in index...word.count - 1 {
//            let char = word[i]
//            guard let node = curr.children[char] else { return nil }
//
//            if node.isWord {
//                if let partialResults = isConcatenated(word, i + 1, node) {
//                    print(partialResults)
//                    for partialResult in partialResults  {
//                        if partialResult.isEmpty {
//                            results.append([node.word])
//                        } else {
//                            results.append([node.word] + partialResult)
//                        }
//                    }
//                }
//            }
//
//            curr = node
//        }
//
//        return results
//    }
//}
//
//func isConcatenated(_ words: [String]) -> [[String]] {
//    let trie = Trie()
//    words.forEach(trie.addWord)
//
//    var results = [[String]]()
//
//    for word in words {
//        let word = Array(word)
//        if let concatenated = trie.isConcatenated(word, 0, trie.root) {
//            //print(results)
//            if concatenated.count > 1 {
//                results.append(contentsOf: concatenated)
//            }
//        }
//    }
//
//    return results
//}
//
//isConcatenated(["rockstar", "rock", "star", "rocks", "tar", "stars", "rockstars", "super", "highway", "high", "way", "superhighway"])


//class TrieNode {
//    var key: Character?
//    var isWord = false
//    var children = [Character: TrieNode]()
//
//    func insert(_ char: Character) -> TrieNode {
//        if let node = children[char] { return node }
//        let node = TrieNode()
//        node.key = char
//        children[char] = node
//        return node
//    }
//}
//
//class Trie {
//    var root = TrieNode()
//
//    func addWord(_ word: String) {
//        var currNode = root
//
//        for char in word {
//            currNode = currNode.insert(char)
//        }
//
//        currNode.isWord = true
//    }
//
//    func composable(_ word: [Character], _ index: Int, _ root: TrieNode) -> [String] {
//        if word.count == index {
//            return []
//        }
//
//        var result = [String]()
//        var curr = root
//        var currWord = ""
//
//        for i in index...word.count-1 {
//            guard let nextNode = curr.children[word[i]] else { return result }
//            currWord.append(word[i])
//
//            if nextNode.isWord {
//                result.
//            }
//
//            curr = nextNode
//        }
//
//        return result
//    }
//
//    func isConcatenated(_ word: [Character], _ start: Int, _ root: TrieNode, _ count: Int) -> Bool {
//
//        if word.count == start { return count  > 1 }
//
//
//        var currNode = root
//
//        for index in start..<word.count {
//            let char = word[index]
//
//            guard let node = currNode.children[char] else {
//                return false
//            }
//
//            if node.isWord {
//                if isConcatenated(word, index + 1, root, count + 1) {
//                    return true
//                }
//            }
//
//            currNode = node
//        }
//
//        return false
//    }
//}
//
//func findAllConcatenatedWordsInADict(_ words: [String]) -> [[String]] {
//    var result = [[String]]()
//    let trie = Trie()
//
//    for word in words {
//        if !word.isEmpty {
//            trie.addWord(word)
//        }
//    }
//
//    for word in words {
//        if !word.isEmpty {
//            let wordArr = Array(word)
//            let words = trie.composable(wordArr, 0, trie.root)
//            if word.count > 1 {
//                result.append(words)
//            }
//        }
//    }
//
//    return result
//}

struct Log {
    let id: String
    let content: String
}

func reorderLogFiles(_ logs: [String]) -> [String] {
    
    var digitLogs = [Log]()
    var letterLogs = [Log]()
    
    for log in logs {
        let splittedData = log
            .split(separator: " ")
            .map(String.init)
        
        let log = Log(id: splittedData[0], content: splittedData[1...].joined(separator: " "))
        
        if Int(splittedData[1]) == nil {
            letterLogs.append(log)
        } else {
            digitLogs.append(log)
        }
    }
    
    letterLogs.sort { $0.content < $1.content || $0.content == $1.content && $0.id < $1.id }
    
    return letterLogs.map { $0.id + " " + $0.content } + digitLogs.map { $0.id + " " + $0.content }
}



struct Event {
    let id: Int
}

import Foundation

final class EventLogger {
    
    private var serialQueue = DispatchQueue(label: "serial-queue")
    private var events: [Event] = []
    
    init() {
        
    }
    
    func logEvents(_ events: [Event]) {
        
    }
    
    func logEvent(_ event: Event) {
        
        serialQueue.async {
            self.events.append(event)
        }
    }
}

//protocol Node: AnyObject {
//    func evaluate() -> Int
//    var left: Node? { get set }
//    var right: Node? { get set }
//
//}
//
//final class AddNode: Node {
//    var left: Node?
//    var right: Node?
//
//    func evaluate() -> Int {
//        guard let lefVal = left?.evaluate(),
//                let rightVal = right?.evaluate() else { return 0 }
//        return lefVal + rightVal
//    }
//}
//
//final class SubNode: Node {
//    var left: Node?
//    var right: Node?
//
//    func evaluate() -> Int {
//        guard let lefVal = left?.evaluate(),
//                let rightVal = right?.evaluate() else { return 0 }
//        return lefVal - rightVal
//    }
//}
//
//final class MulNode: Node {
//    var left: Node?
//    var right: Node?
//
//    func evaluate() -> Int {
//        guard let lefVal = left?.evaluate(),
//                let rightVal = right?.evaluate() else { return 0 }
//        return lefVal * rightVal
//    }
//}
//
//final class DivNode: Node {
//    var left: Node?
//    var right: Node?
//
//    func evaluate() -> Int {
//        guard let lefVal = left?.evaluate(),
//                let rightVal = right?.evaluate() else { return 0 }
//        return lefVal / rightVal
//    }
//}
//
//final class NumNode: Node {
//    var left: Node?
//    var right: Node?
//
//    let val: Int
//
//    init(_ val: Int) {
//        self.val = val
//    }
//
//    func evaluate() -> Int {
//       val
//    }
//}
//
//final class NodeBuilder {
//    static func build(_ char: String) -> Node {
//        switch char {
//        case "+": return AddNode()
//        case "-": return SubNode()
//        case "*": return MulNode()
//        case "/": return DivNode()
//        default: return NumNode(Int(char)!)
//        }
//    }
//}
//
//final class TreeBuilder {
//
//    func buildTree( _ postfix: [String]) -> Node? {
//        var stack = [Node]()
//        for char in postfix {
//            let node = NodeBuilder.build(char)
//            if Int(char) == nil {
//                let b = stack.removeLast()
//                let a = stack.removeLast()
//                node.left = a
//                node.right = b
//            }
//            stack.append(node)
//        }
//
//        return stack.first
//    }
//
//    func evaluate(_ root: Node?) -> Int {
//        guard let root = root else { return 0 }
//
//        root.left?.evaluate()
//        root.right?.evaluate()
//
//        return root.evaluate()
//    }
//}
//
//let treeBuilder = TreeBuilder()
//treeBuilder.evaluate(treeBuilder.buildTree(["3","4","+","2","*","7","/"])) // 2
//treeBuilder.evaluate(treeBuilder.buildTree(["4","5","2","7","+","-","*"])) // -16

func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
    let directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    var queue = [(row:start[0], col: start[1], distance: 0)]
    var visited = Array(repeating: Array(repeating: Int.max, count: maze[0].count), count: maze.count)
    
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let node = queue.removeFirst()
            var count = 0
            
            for dir in directions {
                var nextPos = (row: node.row + dir[0], col: node.col + dir[1], distance: node.distance + 1)
                
                while !(nextPos.row < 0
                        || nextPos.row >= maze.count
                        || nextPos.col < 0
                        || nextPos.col >= maze[0].count
                        || maze[nextPos.row][nextPos.col] == 1) {
                    nextPos = (row: nextPos.row + dir[0], col: nextPos.col + dir[1], distance: nextPos.distance + 1)
                    count += 1
                }
                
                nextPos = (row: nextPos.row - dir[0], col: nextPos.col - dir[1], distance: nextPos.distance - 1)
                
                if visited[node.row][node.col] + count < visited[nextPos.row][nextPos.col] {
                    visited[nextPos.row][nextPos.col] = visited[node.row][node.col] + count
                    queue.append(nextPos)
                }
            }
        }
    }
    
    return visited[destination[0]][destination[1]] == Int.max ? -1 : visited[destination[0]][destination[1]]
}
var path = [[Int]]()

func minPathSum(_ grid: [[Int]]) -> Int {
    let row = grid.count, col = grid[0].count
    var memo = Array(repeating:
                        Array(repeating: -1, count: col),
                     count: row)
    let sum = getMinSum(grid,row - 1 , col - 1, &memo)
    var path = [[Int]]()
    
    getPath(&path, memo,row - 1, col - 1)
    creatPath(&path, memo,row - 1, col - 1)
    print(path)
    return sum
}


func getMinSum(_ grid: [[Int]], _ row: Int, _ col: Int, _ memo: inout [[Int]]) -> Int {
    if row == 0 && col == 0 {
        return grid[0][0]
    }
    
    if row < 0 || col < 0 {
        return Int.max
    }
    
    if memo[row][col] ==  -1 {
        let sum1 = getMinSum(grid, row - 1, col, &memo)
        let sum2 = getMinSum(grid, row, col - 1, &memo)
        
        memo[row][col] = grid[row][col] + min(sum1, sum2)
    }
    
    return memo[row][col]
}

func getPath(_ path: inout [[Int]], _ grid: [[Int]], _ i: Int, _ j: Int) {
    
    path.append([i, j]);
    
    if(i == 0 && j == 0) { return }
    
    if(i == 0 || j > 0 && grid[i][j-1] < grid[i-1][j]) { getPath(&path, grid, i, j-1) }
    
    if(j == 0 || i > 0 && grid[i-1][j] < grid[i][j-1]) { getPath(&path, grid, i-1, j) }
}

minPathSum([[1,3,1],[1,5,1],[4,2,1]])


func creatPath(_ path: inout [[Int]], _ memo: [[Int]], _ row: Int, _ col: Int) {
    path.append([row, col])
    
    if row == 0 && col == 0 { return }
    
    if row == 0 || col > 0 && memo[row][col - 1] < memo[row - 1][col] { creatPath(&path, memo, row, col - 1)}
    if col == 0 || row > 0 && memo[row - 1][col] < memo[row][col - 1] { creatPath(&path, memo, row - 1, col) }
    
}


