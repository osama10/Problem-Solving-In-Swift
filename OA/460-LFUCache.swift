class Node {
    let key: Int
    var value: Int
    var prev: Node?
    var next: Node?
    var freq = 1
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
    
}

class DoubleLinkList {
    var head = Node(key: -1, value: -1)
    var tail = Node(key: -1, value: -1)
    var size = 0
    
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
        
        size += 1
        return node
    }
    
    func removeNode(_ node: Node)  {
        let prev = node.prev
        let next = node.next
        
        prev?.next = next
        next?.prev = prev
        
        size -= 1
        
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
    
    func empty() -> Bool {
        head.next === tail
    }
}

class LFUCache {
    var nodeMap = [Int: Node]()
    var freqMap = [Int: DoubleLinkList]()
    var capacity: Int
    var minFreq = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = nodeMap[key] else { return -1 }
        update(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if let node = nodeMap[key] {
            node.value = value
            update(node)
        } else {
           
            if capacity == nodeMap.keys.count {
                if let list = freqMap[minFreq], let tail = list.popTail() {
                    nodeMap[tail.key] = nil
                }
            }

            let node = Node(key: key, value: value)
            minFreq = 1
           
            if freqMap[minFreq] == nil {
                freqMap[minFreq] = DoubleLinkList()
            }
            
            freqMap[minFreq]!.addNode(node)
            nodeMap[node.key] = node
        }
    }
    
    private func update(_ node: Node) {
        let oldFreq = node.freq
        let newFreq = node.freq + 1
        
        if let list = freqMap[oldFreq] {
            list.removeNode(node)
           
            if minFreq == oldFreq && list.size == 0 {
                minFreq = newFreq
            }
        }
        
        node.freq = newFreq
        
        if freqMap[newFreq] == nil {
                freqMap[newFreq] = DoubleLinkList()
        }
        
        freqMap[newFreq]!.addNode(node)
    }
}