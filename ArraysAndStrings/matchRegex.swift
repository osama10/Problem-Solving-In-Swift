// https://leetcode.com/discuss/interview-question/711486/Snap-or-NYC-or-Phone
func match(_ regex: String, _ words: [String]) -> [String] {
    var result = [String]()
    let regex = Array(regex)
    
    words.forEach { word in
        if isValid(regex, Array(word)) {
            result.append(word)
        }
    }
    
    return result
}

func isValid(_ regex: [Character], _ word: [Character]) -> Bool {
    var regexIndex = 0
    var wordIndex = 0
    
    while regexIndex < regex.count && wordIndex < word.count {
        
        if regex[regexIndex].isLetter {
            if regex[regexIndex] != word[wordIndex] { return false }
            regexIndex += 1
            wordIndex += 1
        } else {
            var digit = ""
            while regexIndex < regex.count
                    && regex[regexIndex] != "*" {
                digit.append(regex[regexIndex])
                regexIndex += 1
            }
            regexIndex += 1
            wordIndex += Int(digit)!
        }
    }
    
    return regexIndex == regex.count && wordIndex == word.count
}


let words = ["world", "word", "would", "wont", "which", "hello", "baaaaaaaaaab"]
let regexes = ["w3*d", "3*d", "4*", "5*", "b10*b", "b5*a4*b"]

regexes.forEach { regex in
    print(match(regex, words))    
}
/*
 ["world", "would"]
 ["word"]
 ["word", "wont"]
 ["world", "would", "which", "hello"]
 ["baaaaaaaaaab"]
 ["baaaaaaaaaab"]

 */
