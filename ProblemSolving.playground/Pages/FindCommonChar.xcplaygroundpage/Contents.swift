import Foundation


func commonChars(_ A: [String]) -> [String] {
    if A.isEmpty || A.count == 1 { return A }
    var commonString = A[0]
    for i in 1..<(A.count) {
        commonString = commons(str1: commonString, str2: A[i])
        if commonString.isEmpty { return [] }
    }
    return commonString.map{ "\($0)" }
 }

func commons(str1: String, str2: String) -> String {
    if str1.isEmpty || str2.isEmpty { return str1 }
    var frequencyTable = [String.Element: Int]()
    str1.forEach { frequencyTable[$0] = (frequencyTable[$0] ?? 0) + 1 }
    var results = [String.Element]()
    str2.forEach { char in
        if let count = frequencyTable[char], count > 0 {
            results.append(char)
            frequencyTable[char] = count - 1
        }
    }
    return String(results)
}

commonChars(["bella","label","roller"])
