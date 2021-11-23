class Node {
    
    let key: Int
    var value: Int
    var prev: Node?
    var next: Node?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }

}

class DoubleLinkList {
    var head = Node(key: -1, value: -1)
    var tail = Node(key: -1, value: -1)
    
    init() {
        head.next = tail
        tail.prev = head
    }
    
    func addNode(_ node: Node) -> Node {
        let nodeNext = head.next
        
        head.next = node
        node.prev = head
        
        node.next = nodeNext
        nodeNext?.prev = node
        
        return node
    }
    
    func removeNode(_ node: Node)  {
        let prev = node.prev
        let next = node.next
        
        prev?.next = next
        next?.prev = prev

    }
    
    func moveToHead(_ node: Node) {
        removeNode(node)
        addNode(node)
    }
    
    func popTail() -> Node? {
        guard let prev = tail.prev else { return nil }
        removeNode(prev)
        return prev
    }
}

class LRUCache {
    let capacity: Int
    let doubleLL = DoubleLinkList()
    var map = [Int: Node]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else { return -1 }
        doubleLL.moveToHead(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.value = value
            doubleLL.moveToHead(node)
        } else {
            addNewNode(key, value)
        }
    }
    
    
    private func addNewNode(_ key: Int, _ value: Int) {
        let node = Node(key: key, value: value)
        if capacity == map.keys.count {
            if let nodeToDelete = doubleLL.popTail() {
                map[nodeToDelete.key] = nil
            }
        }
        doubleLL.addNode(node)
        map[node.key] = node
    }
}