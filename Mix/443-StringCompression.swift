
//443
func compress(_ chars: inout [Character]) -> Int {
    if chars.count == 1 { return 1 }
    var readPtr = 0, writePtr = 0

    while readPtr < chars.count {
        var length = 0
        let char = chars[readPtr]
        while readPtr < chars.count && chars[readPtr] == char {
            readPtr += 1
            length += 1
        }


        chars[writePtr] = chars[readPtr]

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