class Solution {
var visited = Set<String>()

func accountsMerge(_ accounts: [[String]]) -> [[String]] {
    var graph = [String: [String]]()
    var emailUserMap = [String: String]()
    var result = [[String]]()
    
    
    for account in accounts {
        let name = account[0]
        let node = account[1]
        emailUserMap[node] = name
        
        guard account.count > 2 else { continue }
        
        for relatedEmail in account[2..<account.count] {
            emailUserMap[relatedEmail] = name
            graph[node, default: [String]()].append(relatedEmail)
            graph[relatedEmail, default: [String]()].append(node)
        }
    }
    
    for (email, name) in emailUserMap {
        var emails = [String]()
        guard !visited.contains(email) else { continue }
        mergrEmails(graph, email, &emails)
        result.append([name] + emails.sorted())
    }
    
    return result
    
}

func mergrEmails(_ graph: [String:[String]], _ source: String, _ path: inout [String]) {
    path.append(source)
    visited.insert(source)
    
    for next in graph[source, default: [String]()] {
        if !visited.contains(next) {
            mergrEmails(graph, next, &path)
        }
    }
}
}