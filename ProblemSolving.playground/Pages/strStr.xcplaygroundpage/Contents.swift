//: [Previous](@previous)

import Foundation

//28
func strStr(_ haystack: String, _ needle: String) -> Int {

    if haystack == needle || needle.isEmpty { return 0 }
    if haystack.count <= needle.count || haystack.isEmpty { return -1 }

    let haystack = Array(haystack)
    let needle = Array(needle)

    var index = 0

    while index < haystack.count{
        if haystack[index] == needle[0] {
            var needleIndex = 0
            while index + needleIndex < haystack.count && haystack[index + needleIndex] == needle[needleIndex] {
                needleIndex += 1
                if needleIndex == needle.count { return index }
            }
        }

        index += 1
    }

    return -1

}

strStr("abc", "c")
