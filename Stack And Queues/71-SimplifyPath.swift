class Solution {
    func simplifyPath(_ path: String) -> String {
        let directories = path.split(separator: "/").map(String.init)
        var stack = [String]()
        
        for directory in directories {
            if directory == "." || directory.isEmpty {
                continue
            }
            
            if directory == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(directory)
            }
        }
        
        return "/" + stack.joined(separator: "/")
    }
}