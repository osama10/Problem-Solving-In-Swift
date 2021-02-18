//: [Previous](@previous)

import Foundation

//38

func countAndSay(_ n: Int) -> String {
    if n == 1 { return "1" }
    let say = countAndSay(n - 1)
    return charCount(say)
}

func charCount(_ str: String) -> String {

    if str.isEmpty { return "" }

    var result = ""
    var prev: Character?
    var count = 0
    
    for  char in str {
        if prev == nil {
            prev = char
            count += 1
        } else if prev! == char { count += 1 }
        else {
            result += "\(count)\(prev!)"
            prev = char
            count = 1
        }
    }
    result += "\(count)\(prev!)"
    return result
}

print(countAndSay(5))
