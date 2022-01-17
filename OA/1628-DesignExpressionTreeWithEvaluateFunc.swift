
protocol Node: AnyObject {
    func evaluate() -> Int
    var left: Node? { get set }
    var right: Node? { get set }

}

final class AddNode: Node {
    var left: Node?
    var right: Node?
    
    func evaluate() -> Int {
        guard let lefVal = left?.evaluate(),
                let rightVal = right?.evaluate() else { return 0 }
        return lefVal + rightVal
    }
}

final class SubNode: Node {
    var left: Node?
    var right: Node?
    
    func evaluate() -> Int {
        guard let lefVal = left?.evaluate(),
                let rightVal = right?.evaluate() else { return 0 }
        return lefVal - rightVal
    }
}

final class MulNode: Node {
    var left: Node?
    var right: Node?
    
    func evaluate() -> Int {
        guard let lefVal = left?.evaluate(),
                let rightVal = right?.evaluate() else { return 0 }
        return lefVal * rightVal
    }
}

final class DivNode: Node {
    var left: Node?
    var right: Node?
    
    func evaluate() -> Int {
        guard let lefVal = left?.evaluate(),
                let rightVal = right?.evaluate() else { return 0 }
        return lefVal / rightVal
    }
}

final class NumNode: Node {
    var left: Node?
    var right: Node?
    
    let val: Int
    
    init(_ val: Int) {
        self.val = val
    }
    
    func evaluate() -> Int {
       val
    }
}

final class NodeBuilder {
    static func build(_ char: String) -> Node {
        switch char {
        case "+": return AddNode()
        case "-": return SubNode()
        case "*": return MulNode()
        case "/": return DivNode()
        default: return NumNode(Int(char)!)
        }
    }
}

final class TreeBuilder {
    
    func buildTree( _ postfix: [String]) -> Node? {
        var stack = [Node]()
        for char in postfix {
            let node = NodeBuilder.build(char)
            if Int(char) == nil {
                let b = stack.removeLast()
                let a = stack.removeLast()
                node.left = a
                node.right = b
            }
            stack.append(node)
        }
        
        return stack.first
    }
    
    func evaluate(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        
        root.left?.evaluate()
        root.right?.evaluate()
        
        return root.evaluate()
    }
}

let treeBuilder = TreeBuilder()
treeBuilder.evaluate(treeBuilder.buildTree(["3","4","+","2","*","7","/"])) // 2
treeBuilder.evaluate(treeBuilder.buildTree(["4","5","2","7","+","-","*"])) // -16