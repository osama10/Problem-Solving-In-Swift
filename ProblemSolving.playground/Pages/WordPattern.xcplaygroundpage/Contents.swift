import Foundation

/// 290

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let words = s.split(separator: " ")
    if words.count != pattern.count { return false }
    let pattern = Array(pattern)
    var wordLastOccurence = [String.SubSequence: Int]()
    var patternLastOccuerece = [String.Element: Int]()

    for index in 0..<words.count {
        let word = words[index]
        let char = pattern[index]
        if wordLastOccurence[word] != patternLastOccuerece[char] { return false }
        wordLastOccurence[word] = index
        patternLastOccuerece[char] = index
    }

    return true
}


wordPattern("abba", "dog cat cat dog")
