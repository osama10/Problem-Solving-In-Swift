class Solution {
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var prefixSum = Array(repeating: 0, count: n)
        
        for booking in bookings {
            let start = booking[0] - 1
            let end = booking[1] - 1
            let seats = booking[2]
            
            prefixSum[start] += seats
            
            if end < n-1 {
                prefixSum[end + 1] -= seats
            }
        }
       

        for i in 1..<prefixSum.count {
            prefixSum[i] += prefixSum[i - 1] 
        }
        
        return prefixSum
    }
}