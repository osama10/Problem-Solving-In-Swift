class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        let result = calPow(x, abs(n))
        return n < 0 ? 1 / result : result
    }
    
    func calPow(_ x: Double, _ n: Int) -> Double {
        
        if n == 0 {
            return 1.0
        }
        
        let pow = calPow(x, n / 2)
        
        return n % 2 == 0 ? pow * pow : pow * pow * x
    }
}