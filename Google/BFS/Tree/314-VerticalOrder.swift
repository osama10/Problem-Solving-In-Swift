 func verticalOrder(_ root: TreeNode?) -> [[Int]] {
          guard let root = root else { return [] }

    var queue = [(node: root, column: 0)]
    var result = [[Int]]()
    var dict = [Int: [Int]]()
    var minCol = Int.max
    var maxCol = Int.min
    
    while !queue.isEmpty {
        let (node, column) = queue.removeFirst()
        dict[column, default: [Int]()].append(node.val)
       
        minCol = min(minCol, column)
        maxCol = max(maxCol, column)
        
        if let leftChild = node.left {
            queue.append((leftChild, column - 1))
        }

        if let rightChild = node.right {
            queue.append((rightChild, column + 1))
        }
    }
    
    
    for i in minCol...maxCol {
        if let child = dict[i] {
            result.append(child)
        }
    }
    
    return result
    }