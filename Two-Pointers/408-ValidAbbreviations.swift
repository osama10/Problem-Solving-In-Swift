class Solution {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let abbr = tokenize(abbr)
        let word = word.map(String.init)
       
        if abbr.isEmpty {
            return false
        }
        
        var abbrIndex = 0
        var indexStr = 0
        
        while abbrIndex < abbr.count && indexStr < word.count {
            if let num = Int(abbr[abbrIndex]) {
                indexStr += num
                abbrIndex += 1
            } else {
                if word[indexStr] != abbr[abbrIndex] {
                    return false
                }
                
                abbrIndex += 1
                indexStr += 1
            }
        }
    
        return indexStr == word.count && abbrIndex == abbr.count
    }
    
    func tokenize(_ abbr: String) -> [String] {
        var number = ""
        var result = [String]()
        
        for char in abbr {
            if char.isNumber {
                if number.isEmpty && char == "0"{
                    return []
                }
                
                number.append(char)
            } else {
                if !number.isEmpty {
                    result.append(number)
                    number = ""
                }
                result.append(String(char))
            }
        }
        
          if !number.isEmpty {
                result.append(number)
                
            }
        
        return result
    }
}