func compress(_ chars: inout [Character]) -> Int {
    guard chars.count != 1 else { return 1 }
    var readPtr = 0
    var writePtr = 0
    
    while readPtr < chars.count {
        let char = chars[readPtr]
        var length = 0
        
        while readPtr < chars.count && chars[readPtr] == char {
            readPtr += 1
            length += 1
        }
        
        chars[writePtr] = char
        writePtr += 1
        
        if length > 1 {
            for digit in String(length) {
                chars[writePtr] = digit
                writePtr += 1
            }
        }
        
    }
    
    return writePtr
}