func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    guard words.count > 1 else { return true }
    var dict = [Character: Int]()
    order.enumerated().forEach { dict[$1] = $0 + 1 }
    let words = words.map { Array($0) }
   
    for i in 1..<words.count {
        if !isSorted(dict, words[i - 1], words[i]) {
            return false
        }
    }
    
    return true
}

func isSorted(_ dict: [Character: Int], _ word1: [Character], _ word2: [Character]) -> Bool {
    
    for i in 0..<(min(word1.count, word2.count)) {
        if dict[word1[i]]! > dict[word2[i]]! {
            return false
        } else if dict[word1[i]]! < dict[word2[i]]! {
            return true
        }
    }
    
    return word1.count - word2.count <= 0
}
isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")
isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")
isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")
isAlienSorted(["kuvp","q"],"ngxlkthsjuoqcpavbfdermiywz")
isAlienSorted(["app","apple"],"abcdefghijklmnopqrstuvwxyz")
