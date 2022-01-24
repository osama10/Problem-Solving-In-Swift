class Solution {
    
    func one(_ num: Int) -> String {
        switch num {
          case 0: return ""
          case 1: return "One"
          case 2: return "Two"
          case 3: return "Three"
          case 4: return "Four"
          case 5: return "Five"
          case 6: return "Six"
          case 7: return "Seven"
          case 8: return "Eight"
          case 9: return "Nine"
        default: return ""
        }
    }
    
    func twoLessThan20(_ num: Int) -> String{
        switch num {
          case 10: return "Ten"
          case 11: return "Eleven"
          case 12: return "Twelve"
          case 13: return "Thirteen"
          case 14: return "Fourteen"
          case 15: return "Fifteen"
          case 16: return "Sixteen"
          case 17: return "Seventeen"
          case 18: return "Eighteen"
          case 19: return "Nineteen"
          default: return ""
        }
    }
    
    func ten(_ num: Int) -> String {
          switch num {
              case 2: return "Twenty"
              case 3: return "Thirty"
              case 4: return "Forty"
              case 5: return "Fifty"
              case 6: return "Sixty"
              case 7: return "Seventy"
              case 8: return "Eighty"
              case 9: return "Ninety"
              default: return ""
        }
    }
    
    
    func two(_ num: Int) -> String {
        if num == 0 {
            return ""
        }
        
        if num < 10 {
            return one(num)
        } else if num < 20 {
            return twoLessThan20(num)  
        } else {
            let tenDigit = num / 10
            let unitDigit = num - (tenDigit * 10)
            let tenStr = ten(tenDigit)
            let digitStr = one(unitDigit)
            
            return  tenStr + (digitStr.isEmpty ? "" : " " + digitStr )
        }
        
    }
    
    func three(_ num: Int) -> String {
        if num == 0 {
            return ""
        }
        
        let hundredDig = num / 100
        let remainingDig = (num - hundredDig * 100) 
        var result = ""
        
        if hundredDig != 0 {
            result = one(hundredDig) + " " + "Hundred"
        } 
        
        let remainingStr = two(remainingDig)
        
        if !remainingStr.isEmpty {
            if !result.isEmpty {
                result += " "
            }
            result +=  remainingStr
        }
        
        return result
    }
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        
        let billion = num / 1000000000
        let million = (num - billion * 1000000000) / 1000000
        let thousand = (num - billion * 1000000000 - million * 1000000) / 1000
        let hundred = (num - billion * 1000000000 - million * 1000000 - thousand * 1000)
        
        var result = ""
        
        if billion != 0 {
            result = three(billion) + " " + "Billion"
        }
        
        if million != 0 {
            if !result.isEmpty {
                result += " "
            }
            print(million)
            result += three(million) + " " + "Million"
        }
        
        if thousand != 0 {
            if !result.isEmpty {
                result += " "
            }
            result += three(thousand) + " " + "Thousand"
        }
        
        if hundred != 0 {
            if !result.isEmpty {
                result += " "
            }
            
            result += three(hundred) 
        }
        
        return result
    }
}