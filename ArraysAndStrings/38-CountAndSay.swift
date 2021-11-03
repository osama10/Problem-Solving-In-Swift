class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        
        return compressString(Array(countAndSay( n - 1)))
        
    }
    
    func compressString(_ string: [Character]) -> String {
    var result = ""
    var readPtr = 0
    
    while readPtr < string.count {
        var length = 0
        let char = string[readPtr]
        
        while readPtr < string.count && char == string[readPtr] {
            readPtr += 1
            length += 1
        }
       
        result.append(String(length))
        result.append(char)
        
    }
    
    return result
    }
}