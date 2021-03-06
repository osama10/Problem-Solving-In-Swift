
import Foundation
/// 443

func compress(_ chars: inout [Character]) -> Int {
    if chars.count == 1 { return 1 }

    var readPtr = 0, writePtr = 0

    while readPtr < chars.count {
        var totalLength = 0
        let char = chars[readPtr]

        while readPtr < chars.count && chars[readPtr] == char {
            readPtr += 1
            totalLength += 1
        }

        chars[writePtr] = char
        writePtr += 1

        if totalLength > 1 {
            for digit in String(totalLength) {
                chars[writePtr] = digit
                writePtr += 1
            }
        }
    }

    return writePtr

}

var chars: [Character] = ["a","a","b","b","c","c","c"]
compress(&chars)

