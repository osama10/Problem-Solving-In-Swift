/// 4.3 List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).

func levelOrderTraversal(tree: TreeNode) -> [ListNode] {
    var queue = [TreeNode]()
    queue.append(tree)
    var result = [ListNode]()
    
    while !queue.isEmpty {
        var child = [TreeNode]()
        var head: ListNode?
        var current: ListNode?
        queue.forEach { parent in
            if head == nil {
                head = ListNode(parent.val)
                current = head
            } else {
                current?.next = ListNode(parent.val)
                current = current?.next
            }
            if let left = parent.left { child.append(left)}
            if let right = parent.right { child.append(right)}
        }
        result.append(head!)
        queue = child
    }
    
    return result
}

func printList(listArr: [ListNode]) {
    listArr.forEach { list in
        var curr: ListNode? = list
        var levels = [Int]()
        while curr != nil {
            levels.append(curr!.val)
            curr = curr?.next
        }
        print(levels)
    }
}


let root = TreeNode(2)
let rootRight = TreeNode(4)
let rootLeft = TreeNode(0)

root.left = rootLeft
root.right = rootRight

let child0 = TreeNode(-1)
let child1 = TreeNode(1)
let child2 = TreeNode(3)
let child3 = TreeNode(5)

rootLeft.left = child0
rootLeft.right = child1
rootRight.left = child2
rootRight.right = child3

printList(listArr: levelOrderTraversal(tree: root))
