class Solution:
    def checkEquivalence(self, root1: 'Node', root2: 'Node') -> bool:
        def find_vals(root):
            vals = defaultdict(lambda: 0)
            
            def pre_order(root):
                if root is None:
                    return
                if root.val != "+":
                    vals[root.val] += 1
                pre_order(root.left)
                pre_order(root.right)
                
            pre_order(root)
            return vals

        return find_vals(root1) == find_vals(root2)
