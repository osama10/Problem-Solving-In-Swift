class Solution {
func addStrings(_ num1: String, _ num2: String) -> String {
      var num1 = Array(num1)
      var num2 = Array(num2)
      
      var carry = 0
      var result = ""
      
      while !num1.isEmpty || !num2.isEmpty {
          let val1 = num1.isEmpty ? "0" : num1.removeLast()
          let val2 = num2.isEmpty ? "0" : num2.removeLast()
          
          let sum = Int(String(val1))! + Int(String(val2))! + carry
          
          result.append("\(sum%10)")
          carry = sum / 10
      }
      
      if carry != 0 {
          result.append("\(carry)")
      }
      
      return String(result.reversed())
  }

}