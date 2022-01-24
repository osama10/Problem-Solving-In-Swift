class Solution {    
    func romanMapper(_ char: Character) -> Int {
        switch char {
            case "I":
                return 1
            case "V":
                return 5
            case "X":
                return 10
            case "L":
                return 50
            case "C":
                return 100
            case "D":
                return 500
            case "M":
                return 1000
            default:
                return -1 // return error case
        }
    } 
    
    func romanToInt(_ s: String) -> Int {
        var result = 0
        var roman = Array(s)
        var index = 0
        
        while index < roman.count {
            let value = romanMapper(roman[index])
           
            if index + 1 < roman.count {
                let nextValue = romanMapper(roman[index + 1])
                result += value >= nextValue ? value : -value
        
            } else {
                result += value
            }
            
            index += 1
        }
        
        return result
    }
}