import Foundation
// https://www.geeksforgeeks.org/count-distinct-substrings-string-using-suffix-trie/
//class TrieNode {
//    var value: Character?
//    var children = [Character: TrieNode]()
//    var word = false
//    var locations = [Int]()
//
//    init(_ value: Character? = nil) { self.value = value }
//
//    func create(_ value: Character) -> TrieNode {
//        if let node = children[value] {return node}
//
//        let childNode = TrieNode(value)
//        children[value] = childNode
//        return childNode
//    }
//
//    func getChild(_ value: Character) -> TrieNode? { children[value] }
//
//}
//
//class Trie {
//    var root = TrieNode()
//
//    func add( _ word: String, _ offset: Int) {
//        if word.isEmpty { return }
//        var node = root
//        word.forEach { node = node.create($0) }
//        node.locations.append(offset)
//        node.word = true
//    }
//
//    func search(_ word: String) -> Bool {
//        var node = root
//        for char in word {
//            if let nextNode = node.getChild(char) { node = nextNode }
//            else { return false }
//        }
//        return true
//    }
//
//    func searchLocation(_ word: String) -> [Int] {
//        var node = root
//        var locations = [Int]()
//        for char in word {
//            if let nextNode = node.getChild(char) { node = nextNode}
//            else { return [] }
//        }
//        findAllLocations(node, &locations)
//        return locations
//    }
//
//    func findAllLocations(_ root: TrieNode, _ locations: inout [Int]) {
//        if root.word { locations.append(contentsOf: root.locations) }
//        if root.children.isEmpty { return }
//        for child in root.children.values { findAllLocations(child, &locations) }
//    }
//
//}
//
//func countDistinctSubstring(_ str: String) -> Int {
//    let trie = Trie()
//    for i in 0..<str.count {
//        let suffix = String(str.suffix((str.count - i)))
//        print(suffix)
//        trie.add(suffix, i)
//    }
//    var totalNodes = 0
//    countNodes(trie.root, &totalNodes)
//    return totalNodes + 1
//}
//
//func countNodes(_ root: TrieNode, _ totalNodes: inout Int) {
//    if root.children.isEmpty { return  }
//    totalNodes +=  root.children.count
//    for child in root.children.values { countNodes(child, &totalNodes) }
//}
//
//countDistinctSubstring("ab")
//countDistinctSubstring("ababa")
//countDistinctSubstring("osama")
//
//
////func checkForSubString(_ str: String, _ substring: String) -> Bool {
////    let trie = Trie()
////
////    for i in 0..<str.count {
////        let suffix = String(str.suffix((str.count - i)))
////        trie.add(suffix, i)
////    }
////    return trie.search(substring)
////}
//
//func checkForSubString(_ str: String, _ substring: String) -> [Int] {
//    let trie = Trie()
//
//    for i in 0..<str.count {
//        let suffix = String(str.suffix((str.count - i)))
//        trie.add(suffix, i)
//    }
//    return trie.searchLocation(substring)
//}
//
//
////checkForSubString("THIS IS A TEST TEXT$","TEST")
////checkForSubString("THIS IS A TEST TEXT$","A")
////checkForSubString("THIS IS A TEST TEXT$"," ")
////checkForSubString("THIS IS A TEST TEXT$","IS A")
////checkForSubString("THIS IS A TEST TEXT$"," IS A ")
////checkForSubString("THIS IS A TEST TEXT$","TEST1")
////checkForSubString("THIS IS A TEST TEXT$","THIS IS GOOD")
////checkForSubString("THIS IS A TEST TEXT$","TES")
////checkForSubString("THIS IS A TEST TEXT$","TESA")
////checkForSubString("THIS IS A TEST TEXT$","ISB")
//
//
//checkForSubString("GEEKSFORGEEKS", "GEEKS") // [0, 8]
//checkForSubString("GEEKSFORGEEKS", "GEEK1") // [] no substring
//checkForSubString("GEEKSFORGEEKS", "FOR") // [5]
//checkForSubString("AABAACAADAABAAABAA", "AABA") // [13, 0 ,9]
//checkForSubString("AABAACAADAABAAABAA", "AA") // [16, 12, 3, 13, 0, 9, 6]
//checkForSubString("AABAACAADAABAAABAA", "EA") // []
//checkForSubString("AAAAAAAAA", "AAAA") // [5, 4, 3, 2, 1, 0]
//checkForSubString("AAAAAAAAA", "AA")// [7, 6, 5, 4, 3, 2, 1, 0]
//checkForSubString("AAAAAAAAA", "A") // [8, 7, 6, 5, 4, 3, 2, 1, 0]

