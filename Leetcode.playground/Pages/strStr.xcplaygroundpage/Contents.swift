//: [Previous](@previous)

import Foundation

//28
func strStr(_ haystack: String, _ needle: String) -> Int {

    if haystack == needle || needle.isEmpty { return 0 }
    if haystack.count <= needle.count || haystack.isEmpty { return -1 }

    let haystackArr = Array(haystack)
    let needleArr = Array(needle)
    var index = 0

    while index < haystackArr.count {
        if haystackArr[index] == needleArr[0] {
            var indexOfNeedleArr = 0
            while haystackArr[index + indexOfNeedleArr] == needleArr[indexOfNeedleArr] {
                if indexOfNeedleArr == needleArr.count - 1 { return index }
                indexOfNeedleArr += 1
                if (index + indexOfNeedleArr) == haystackArr.count { break }
            }
        }
        index += 1
    }

    return -1
}

func strStr1(_ haystack: String, _ needle: String) -> Int {

    if haystack == needle || needle.isEmpty { return 0 }
    if haystack.count <= needle.count || haystack.isEmpty { return -1 }

    let haystackArr = Array(haystack)
    let needleArr = Array(needle)
    var index = 0

    while index < haystackArr.count {
        if haystackArr[index] == needleArr[0] {
            var needleIndex = 0
            while ((index + needleIndex < haystackArr.count)
                  && haystackArr[index + needleIndex] == needleArr[needleIndex]) {

                needleIndex += 1

                if needleIndex == needleArr.count { return index }
            }
        }

        index += 1
    }
    return -1
}

strStr("abc", "c")
strStr1("abc", "c")
