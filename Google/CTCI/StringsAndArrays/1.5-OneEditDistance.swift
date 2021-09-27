func isOneEditDistance(_ s: String, _ t: String) -> Bool {
    if s == t || abs(s.count - t.count) > 1 { return false }
    
    if s.count == t.count {
        return checkInsertCase(Array(s), Array(t))
    } else {
        if s.count < t.count {
            return deleteAndInsertCase(Array(t), Array(s))
        } else {
            return deleteAndInsertCase(Array(s), Array(t))
        }
    }
}

func deleteAndInsertCase(_ bigStr: [Character], _ smallStr: [Character]) -> Bool {
    var count = 0
    var smallIndex = 0
    var bigIndex = 0
    
    while smallIndex <= smallStr.count - 1
            && bigIndex <= bigStr.count - 1
            && count <= 1 {
        
        if smallStr[smallIndex] != bigStr[bigIndex] {
            count += 1
            
        } else {
            smallIndex += 1
        }
        
        bigIndex += 1
    }
    
    return count <= 1
}

func checkInsertCase(_ str1: [Character], _ str2: [Character]) -> Bool {
    var countOfDifferentChars = 0
    
    for i in 0..<str1.count {
        if countOfDifferentChars > 1 {
            return false
        }
        
        if str1[i] != str2[i] {
            countOfDifferentChars += 1
        }
    }
    
    return countOfDifferentChars <= 1
}

isOneEditDistance("ab", "ba")
