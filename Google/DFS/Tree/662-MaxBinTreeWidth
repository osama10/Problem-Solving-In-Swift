// index of left = 2 * parentIndex
// index of right = 2 * parentIndex + 1

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [(TreeNode, Int)] = []
        queue.append((root, 1))
        var maxLen = 1
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0 ..< count {
                let curr = queue.removeFirst() 
                let index = curr.1
                if let left = curr.0.left {
                    queue.append((left, index &* 2))
                }

                if let right = curr.0.right {
                    queue.append((right, index &* 2 + 1))
                }
            }
            if !queue.isEmpty {
                maxLen = max(maxLen, queue.last!.1 &- queue.first!.1 &+ 1)                
            }
        }
        
        return maxLen
    }
