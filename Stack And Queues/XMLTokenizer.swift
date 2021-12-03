/*#
 Implement Parse
 
 # public XMLDocument parse(Tokenizer tokenizer) {
 #   // TODO: Implement this.
 # }
 #
 # <a>
 #   <b>
 #     <c>foo</c>
 #     <c></c>
 #   </b>
 #   <d>blah</d>
 # </a>
 #
 # Some entities:
 # - <root>
 #    <child1>
 #        <subchild>...</subchild>
 #    <child2>
 
 Using these interfaces
# interface Tokenizer {
#   Token nextToken();
# }
#
# interface Token {
#   String value();
#   TokenType type();
# }
#
# enum TokenType {
#   BEGIN,
#   END,
#   TEXT,
# }
#
# * Each call to tokenzer.nextToken() returns:
#  * {
#  *   value: 'a',
#  *   type: 'BEGIN'
#  * }
#  * {
#  *   value: 'b',
#  *   type: 'BEGIN'
#  * }
#  * {
#  *   value: 'c',
#  *   type: 'BEGIN'
#  * }
#  * {
#  *   value: 'foo',
#  *   type: 'TEXT'
#  * }
#  * {
#  *   value: 'c',
#  *   type: 'END'
#  * }
#  * {
#  *   value: 'c',
#  *   type: 'BEGIN'
#  * }
#  * {
#  *   value: 'c',
#  *   type: 'END'
#  * }
#  * {
#  *   value: 'b',
#  *   type: 'END'
#  * }
#  * {
#  *   value: 'd',
#  *   type: 'BEGIN'
#  * }
#  * {
#  *   value: 'blah',
#  *   type: 'TEXT'
#  * }
#  * {
#  *   value: 'd',
#  *   type: 'END'
#  * }
#  * {
#  *   value: 'a',
#  *   type: 'END'
#  * }
#
*/


class XMLNode {
    let value: String
    var content = ""
    var children = [XMLNode]()
    
    init(_ value: String) {
        self.value = value
    }
    
}
enum TokenType {
    case begin, text, end
}

protocol Token {
    func value() -> String
    func type() -> TokenType
}

protocol Tokenizer {
    func nextToken() -> Token?
}

func parse(_ tokenizer: Tokenizer) -> XMLNode? {
   
    var stack = [XMLNode]()
    
    while let token = tokenizer.nextToken() {
        switch token.type() {
        case .begin:
            let node = XMLNode(token.value())
            stack.append(node)
        case .end:
            if stack.count > 1 {
                let childNode = stack.removeLast()
                stack.last?.children.append(childNode)
            }
        case .text:
            stack.last?.content = token.value()
        }
    }
    
    return stack.isEmpty ? nil : stack[0]
}

func print(_ root: XMLNode) {
    var queue = [root]
    var level = 0
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let space = String(repeating: " ", count: level)
            let node = queue.removeFirst()
            let value = space + "name: \(node.value)" + " - " + "content: \(node.content)"
            print(value)
            
            for childNode in root.children {
                queue.append(childNode)
            }
        }
        
        level += 1
    }
}
