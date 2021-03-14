import Foundation

/// https://www.geeksforgeeks.org/count-of-substrings-having-all-distinct-characters/?ref=rp
func countSub(_ str: String) -> Int {
    if str.count < 2 { return str.count }

    let str = Array(str)
    var charFrequency = [Character: Int]()

    var i = 0
    var j = 0

    var ans = 0
    var result = [String]()
    var substring = ""
    while i < str.count {
        if j < str.count && charFrequency[str[j], default: 0] == 0 {

            charFrequency[str[j]] = 1
            ans += (j - i) + 1
            substring.append(str[j])
            result.append(substring)
            j += 1
        } else {
            substring = ""
            charFrequency[str[i], default: 0] -= 1
            i += 1
        }
    }

    return ans
}

countSub("gfag")
