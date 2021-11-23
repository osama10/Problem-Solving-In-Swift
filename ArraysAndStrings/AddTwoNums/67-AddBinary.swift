class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = a
        var b = b
        var carry: Character = "0"
        var result = ""
        
        while !a.isEmpty || !b.isEmpty {
            let bit1 = a.isEmpty ? "0" : a.removeLast()
            let bit2 = b.isEmpty ? "0" :b.removeLast()
            
            let (bit, newCarry) = addBits(bit1, bit2, carry)
            result.append(bit)
            carry = newCarry
        }
        
        if carry == "1"{
           result.append("1")
        }
        
        return String(result.reversed())
    }
    
    func addBits(_ bit1: Character, _ bit2: Character, _ carry: Character) ->(bit: Character, carry: Character) {
        var count = 0
        
        if bit1 == "1" {
            count += 1
        }
        
        if bit2 == "1" {
            count += 1
        }
        
        if carry == "1" {
            count += 1
        }
        
        let bit: Character = (count == 3 || count == 1) ? "1" : "0"
        let carry: Character = (count > 1) ? "1" : "0"
        
        return (bit, carry)
    }
    
}
