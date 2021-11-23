class Solution {
   func findDuplicate(_ paths: [String]) -> [[String]] {
    var splitedPaths = [[String]]()
    var files = [String]()
    var duplicateFiles = [String: [String]]()
       
    for path in paths {
        let newPath = path
            .split(separator: " ")
            .map(String.init)
        splitedPaths.append(newPath)
    }
    
    for path in splitedPaths {
        let directory = path[0]
        for fileName in path[1..<path.count] {
            files.append(directory + "/" + fileName)
        }
    }
    
    for file in files {
        let (file, content) = splitFileFromContent(file)
        duplicateFiles[content, default: []].append(file)
    }
    
    return Array(duplicateFiles.values)
       .filter { $0.count > 1 }
}

func splitFileFromContent(_ fileAndContent: String) -> (file: String, content: String) {
    var file = ""
    
    for char in fileAndContent {
        if char == "(" {
            break
        } else {
            file.append(char)
        }
    }
    
    let content = fileAndContent.suffix(fileAndContent.count - file.count)
    return (file, String(content))
}
}