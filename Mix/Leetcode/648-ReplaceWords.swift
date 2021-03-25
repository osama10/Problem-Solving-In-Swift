func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
    var splitSentence = sentence
        .split(separator: " ")
        .map(String.init)

    for root in dictionary {
        for index in 0..<splitSentence.count {
            if splitSentence[index].hasPrefix(root) { splitSentence[index] = root }
        }
    }

    return splitSentence
        .joined(separator: " ")
}