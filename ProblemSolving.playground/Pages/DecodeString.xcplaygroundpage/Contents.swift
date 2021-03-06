import Foundation

/// 394
func decodeString(_ s: String) -> String {

    var stack = [(String, Int)]()
    var result = ""
    var num = 0

    for char in s {
        switch char {
        case _ where char.isNumber:
            num *= 10
            num += Int(String(char))!
        case "[":
            stack.append((result, num))
            result = ""
            num = 0
        case "]":
            let (prevResult, freq) = stack.removeLast()
            result = prevResult + String(repeating: result, count: freq)
        default:
            result += String(char)
        }
    }

    return result
}

decodeString("3[a2[c]]")

