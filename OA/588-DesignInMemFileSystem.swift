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

/**
 * Your FileSystem object will be instantiated and called as such:
 * let obj = FileSystem()
 * let ret_1: [String] = obj.ls(path)
 * obj.mkdir(path)
 * obj.addContentToFile(filePath, content)
 * let ret_4: String = obj.readContentFromFile(filePath)
 */