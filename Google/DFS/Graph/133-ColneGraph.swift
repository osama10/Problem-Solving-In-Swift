 func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
       
        var queue = [node]
        
        dict[node] = Node(node.val)
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
           
            for neighbor in current.neighbors {
                if let neighbor = neighbor {
                    if dict[neighbor] == nil {
                        let newNode = Node(neighbor.val)
                        dict[neighbor] = newNode 
                        queue.append(neighbor)
                    } 
                    
                 dict[current]!.neighbors.append(dict[neighbor]!)

                }
               
            }
            
        }
        
        return dict[node]
    }