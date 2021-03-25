// 38
func countAndSay(_ n: Int) -> String { n == 1 ? "1" : charCount(countAndSay(n-1)) }

func charCount(_ str: String) -> String {
    if str.isEmpty { return "" }
    var prevChar: Character?
    var count = 0
    var result = ""

    for char in str {
        if prevChar == nil {
            prevChar = char
            count += 1
        } else if prevChar! == char {
            count += 1
        } else {
            result += String(count) + String(prevChar!)
            prevChar = char
            count = 1
        }
    }

    result += String(count) + String(prevChar!)
    return result
}