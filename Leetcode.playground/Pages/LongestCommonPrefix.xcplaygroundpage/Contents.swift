import Foundation

//14
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return "" }
    if strs.count == 1 { return strs.first!}

    var commonPrefix = strs[0]
    for str in strs.dropFirst() {
        commonPrefix = common(commonPrefix, str)
        if commonPrefix.isEmpty { return "" }
    }

    return commonPrefix
}

func common(_ str1: String, _ str2: String) -> String {
    if str1 == str2 { return str1 }
    var commonPrefix = str1

    while !commonPrefix.isEmpty {
        if str2.hasPrefix(commonPrefix) { return commonPrefix }
        commonPrefix = String(commonPrefix.dropLast())
    }

    return commonPrefix
}

longestCommonPrefix(["flower","flow","flight"])
