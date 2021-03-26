// 20
func isValid(_ s: String) -> Bool {
    let matching : [Character: Character] = [ "]" : "[", ")" : "(", "}" : "{" ]
    let openBrackets = Set("([{")
    var stack = [Character]()

    for bracket in s {
        if openBrackets.contains(bracket) { stack.append(bracket) }
        else { guard let openBracket = stack.popLast(), matching[bracket] == openBracket else { return false } }
    }

    return stack.isEmpty
}
