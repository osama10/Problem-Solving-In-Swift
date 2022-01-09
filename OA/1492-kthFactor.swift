class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        if k == 1 { return 1 }
        var factorCount = 1
        
        for i in 2...n {
            if n % i == 0 {
                factorCount += 1
                if factorCount == k {
                    return i
                }
            }
        }
        
        return -1
    }
}