func generateParenthesis(_ n: Int) -> [String] {
    var allParenthesis = [String]()
    bracketGenerator(n, 0, 0, "", &allParenthesis)
    return allParenthesis
}

func bracketGenerator(_ total: Int,
                      _ openBracket: Int,
                      _ closeBracket: Int,
                      _ parenthesis: String,
                      _ allParenthesis: inout [String]) {
    
    if parenthesis.count == 2 * total  {
        allParenthesis.append(parenthesis)
    } else {
        if openBracket < total {
            bracketGenerator(total, openBracket + 1, closeBracket, parenthesis + "(", &allParenthesis)
        }
        
        if closeBracket < openBracket {
            bracketGenerator(total, openBracket, closeBracket + 1, parenthesis + ")", &allParenthesis)

        }
    }
}