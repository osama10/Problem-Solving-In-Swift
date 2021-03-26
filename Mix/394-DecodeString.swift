/// 394
func decodeString(_ s: String) -> String {
    var result = ""
    var number = 0
    var stack = [(String, Int)]()

    for char in s {
        switch char {
        case _ where char.isNumber:
            number = (number * 10) + Int(String(char))!
        case "[":
            stack.append((result, number))
            result = ""
            number = 0
        case "]":
            let (partialResult, freq) = stack.removeLast()
            result = partialResult + String(repeating: result, count: freq)

        default:
            result.append(char)
        }
    }

    return result

}