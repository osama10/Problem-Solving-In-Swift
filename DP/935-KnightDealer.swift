class Solution {
    let positions: [Int: [Int]] = [1:[6,8], 2:[7,9], 3:[4,8],
                               4:[3,9,0], 5:[], 6:[1,7,0],
                               7:[2,6], 8:[1,3], 9:[2,4], 0:[4,6]]
    var memo = Array(repeating: Array(repeating: -1, count: 10), count: 5001)
    let mod: Int = Int(1e9 + 7)

    func knightDialer(_ n: Int) -> Int {
        var count = 0
    
        for num in positions.keys {
            count += calculatePhoneNumber(n, num) 
        }
    
        return count % mod
    }

    func calculatePhoneNumber(_ n: Int, _ num: Int) -> Int {
        if  memo[n][num] != -1 { return memo[n][num] }
    
        if n == 1 {
            return 1
        }
    
        var count = 0
    
        for nextNum in positions[num]! {
            count += calculatePhoneNumber(n - 1, nextNum) 
        }
    
        memo[n][num] = count % mod
    
        return memo[n][num]
    }

}