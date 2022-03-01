class Solution {
   func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
    guard wordList.contains(endWord) else { return [] }
    let adjList = bfs(beginWord, endWord, Set(wordList))
    var path = [String]()
    var allPossiblePaths = [[String]]()
    constructPath(beginWord, endWord, adjList, &path, &allPossiblePaths)
    return allPossiblePaths
}

func bfs(_ beginWord: String, _ endWord: String, _ wordList: Set<String>) -> [String: [String]] {
    var queue = [beginWord]
    var wordList = wordList
    var visited = Set<String>()
    var adjList = [String: [String]]()
    
    visited.insert(beginWord)
    wordList.remove(beginWord)
    
    while !queue.isEmpty {
        let levelCount = queue.count
        var elementsToRemove = Set<String>()
        
        for _ in 0..<levelCount {
            let word = queue.removeFirst()
            let nextPossibleWords = getChildren(Array(word), wordList)
            
            for nextWord in nextPossibleWords {
                elementsToRemove.insert(nextWord)

                adjList[word, default: []].append(nextWord)
                               
                if !visited.contains(nextWord) {
                    visited.insert(nextWord)
                    queue.append(nextWord)
                }
            }
        
        }
		
        wordList.subtract(visited) // removes the already visited node from the list to ensure no cycle occurs
    }
    
    return adjList
    
}

func constructPath(_ node: String, _ target: String, _ adjList: [String: [String]], _ path: inout [String], _ allPath: inout [[String]]) {
    path.append(node)
    
    if node == target {
        allPath.append(path)
    } else {
        for nextNode in adjList[node, default: []] {
            constructPath(nextNode, target, adjList, &path, &allPath)
        }
    }
    
    path.removeLast()
}

func getChildren(_ word: [Character], _ wordList: Set<String>) -> [String] {
    var children = [String]()
    let alphabets = "abcdefghijklmnopqrstuvwxyz"
    var word = word
    
    for (i, orgChar) in word.enumerated() {
        for char in alphabets {
            if char  != orgChar {
                var possibleChild = word
                possibleChild[i] = char
                let possibleStr = String(possibleChild)
                if wordList.contains(possibleStr) {
                    children.append(possibleStr)
                }
            }
            word[i] = orgChar
        }
    }
    
    return children
}
}