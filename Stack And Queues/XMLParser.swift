class XMLNode {
    let name: String
    var content = ""
    var children = [XMLNode]()
    var attribs = [String]()
    
    init(_ name: String) {
        self.name = name
    }
}

func xmlParser(_ xml: String) -> XMLNode {
    let tokens: [String] = xml
        .split(separator: ">")
        .map(String.init)
    
    var stack = [XMLNode]()

    for tokenStr in tokens {
        
        if tokenStr[tokenStr.startIndex] == "<" {
            let secondIndex = tokenStr.index(after: tokenStr.startIndex)
            
            if tokenStr[secondIndex] == "/" {
                if stack.count <= 1 { break }
                let childNode = stack.removeLast()
                stack.last!.children.append(childNode)
                
            } else {
                let data = tokenStr.split(separator: " ")
                let node = XMLNode(String(data[0].dropFirst()))
                
                if data.count > 1 {
                    for atrrib in data[1...] {
                        node.attribs.append(String(atrrib))
                    }
                }
                
                stack.append(node)
            }
        } else {
            let data = tokenStr
                .split(separator: "<")
                .map(String.init)
            stack.last!.content = data[0]
            if stack.count == 1 { break }
            let childNode = stack.removeLast()
            stack.last!.children.append(childNode)
        }
    }
    
    return stack.removeLast()
}


func printXml(_ root: XMLNode) {
    print("name: \(root.name)",
          " - content: \(root.content)",
          " - attrib: \(root.attribs)",
          " - children: \(root.children)")
    
    for childNode in root.children {
        printXml(childNode)
    }
}

let xml1 = "<root><child att_1='hello' att_2='user'><subchild>Some contents</subchild></child></root>"
let xml2 = "<root><child att_1='hello' att_2='user'><subchild>Some contents</subchild></child><child2><subchild2 att_3='subchild.att'>More contents</subchild2></child2><child3>Higher contents</child3></root>"

let root = xmlParser(xml2)
printXml(root)
