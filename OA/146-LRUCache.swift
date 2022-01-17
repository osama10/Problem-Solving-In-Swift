class LRUNode {
    var key: Int
    var value: Int
    var next: LRUNode?
    var prev: LRUNode?
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
    
}

final class DoubleLL {
    var head: LRUNode
    var tail: LRUNode
    
    init() {
        self.head = LRUNode(-1, -1)
        self.tail = LRUNode(-1, -1)
        head.next = tail
        tail.prev = head
    }
    
    func add(_ node: LRUNode) {
        let temp = head.next
        
        head.next = node
        node.prev = head
        
        node.next = temp
        temp?.prev = node
    }
    
    func remove(_ node: LRUNode)  {
        let prev = node.prev
        let next = node.next
        
        prev?.next = next
        next?.prev = prev
    }
    
    func moveToHead(_ node: LRUNode) {
        remove(node)
        add(node)
    }
    
    func removeTop() -> LRUNode? {
        guard let last = tail.prev else { return nil }
        remove(last)
        return last
    }
}

final class LRUCache {
    let capacity: Int
    var map = [Int: LRUNode]()
    let doubleLL = DoubleLL(
    )
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else { return -1 }
        doubleLL.moveToHead(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard let node = map[key] else {
            let node = LRUNode(key, value)
            addNewNode(node)
            return
        }
        
        node.value = value
        map[key] = node
        doubleLL.moveToHead(node)
    }
    
    private func addNewNode(_ node: LRUNode) {
        if capacity == map.keys.count {
            if let last = doubleLL.removeTop() {
                map[last.key] = nil
            }
        }
        
        doubleLL.add(node)
        map[node.key] = node
    }
}