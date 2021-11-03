class Solution {
    
    func isHappy(_ n: Int) -> Bool {
        var fast = n
        var slow = n
        
        repeat {
            slow = findHappyNumber(slow)
            fast = findHappyNumber(findHappyNumber(fast))
        } while (slow != fast)
        
        
        return slow == 1
    }
    
    func findHappyNumber(_ n: Int) -> Int {
        var result = 0
        var n = n
        
        while n != 0 {
            let digit = n % 10
            n = n / 10
            result += digit * digit
        }
        
        
        return result
    }
}