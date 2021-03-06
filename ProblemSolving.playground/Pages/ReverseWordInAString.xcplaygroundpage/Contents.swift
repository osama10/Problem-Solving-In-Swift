//: [Previous](@previous)

import Foundation

/// 151

func reverseWords(_ s: String) -> String {
    s
    .split(separator: " ")
    .reversed()
    .joined(separator: " ")
}


func reverseWordsInPlace(_ s: String) -> String {
    var s = Array(s)

    var endIndex = s.count - 1

    while s[endIndex] == " " {
        s.removeLast()
        endIndex = endIndex - 1
    }

    s.reverse()

    while s[endIndex] == " " {
        s.removeLast()
        endIndex = endIndex - 1
    }


    var start = 0
    while start < endIndex {
        var charLength = start
        while charLength < s.count && s[charLength] != " " { charLength += 1 }
        s[start..<charLength].reverse()
        start = charLength + 1
    }

    for i in stride(from: endIndex - 1, through: 0, by: -1) {
        if (i > 0 && i < s.count - 1) && (s[i] == " " && s[i - 1 ] == " ") { s.remove(at: i) }
    }
    return String(s)
}



reverseWordsInPlace("a   b")
reverseWords("a   b")
