import Foundation

/// 125
//func isPalindrome(_ s: String) -> Bool {
//    if s.isEmpty { return true }
//    let alphaNumericString = s
//        .components(separatedBy: CharacterSet.alphanumerics.inverted)
//        .joined()
//        .lowercased()
//    return alphaNumericString.isEmpty || (alphaNumericString == String(alphaNumericString.reversed()))
//}

func isPalindrome(_ s: String) -> Bool {
    if s.isEmpty { return true }
    let s = Array(s.lowercased())
    var start = 0
    var end = s.count - 1

    while start < end {
        if !(s[start].isNumber || s[start].isLetter) {
            start += 1
        } else if !(s[end].isNumber || s[end].isLetter) {
            end -= 1
        } else if s[start] == s[end] {
            start += 1
            end -= 1
        } else {
            return false
        }
    }

    return true
}

isPalindrome("")
