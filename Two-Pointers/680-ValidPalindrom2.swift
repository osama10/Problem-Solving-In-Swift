class Solution {
    
    func checkPalindrome(_ sArr: [Character], _ left: Int, _ right: Int) ->Bool {
        var left = left
        var right = right
        
        while left < right {
            if  sArr[left] != sArr[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
    
    
    func validPalindrome(_ s: String) -> Bool {
       var sArr = Array(s)
        var left = 0
        var right = s.count - 1

        while left < right {
             if  sArr[left] != sArr[right] { 
                return checkPalindrome(sArr, left, right - 1) || checkPalindrome(sArr, left + 1, right ) 
             }
            
             left += 1
             right -= 1
        }
        
        
        return true
    }
}