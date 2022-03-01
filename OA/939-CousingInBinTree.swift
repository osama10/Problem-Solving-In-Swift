class Solution {
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var queue = [root]
        
        while !queue.isEmpty {
            let count = queue.count
            var foundIndex = [Int]()
            
            for i in 0..<count {
                if let node = queue.removeFirst() {
                    if node.val == x || node.val == y {
                        if foundIndex.isEmpty {
                            foundIndex.append(i)
                        } else {
                            return foundIndex[0] % 2 != 0 ||  foundIndex[0] != i - 1
                        }
                    }
                    
                    queue.append(node.left)
                    queue.append(node.right)
                }
            }
        }
        
        return false
    }
}