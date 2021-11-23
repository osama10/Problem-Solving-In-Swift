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

class Solution1 {
    func decodeString(_ s: String) -> String {
        var stack = [Character]()
        var result = ""
        
        for char in s {
            if char == "]" {
                var temp = [Character]()
                while !stack.isEmpty, let value = stack.last {
                    stack.removeLast()
                    if value == "[" { break }
                    temp.append(value)
                }
                 
                var freq = ""
                
                while let value = stack.last, value.isNumber {
                    freq = String(value) + freq
                    stack.removeLast()
                }

                for _ in 0..<Int(freq)! {
                    for i in stride(from: temp.count - 1, to: -1, by: -1) {
                        stack.append(temp[i])
                    }
                }
                
                
            } else {
                stack.append(char)
            }
        }
        
        while !stack.isEmpty {
            result.append(stack.removeFirst())
        }
        
        return result

    }
    
}
