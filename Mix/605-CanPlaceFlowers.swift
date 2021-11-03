class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        guard n > 0 else { return true }
        var current = 0
        var flowerbed = flowerbed
       
        var n = n
        
        while current < flowerbed.count && n > 0 {
            if flowerbed[current] == 0 
            && ( current == flowerbed.count - 1 || flowerbed[current + 1] == 0 )
            && ( current == 0 || flowerbed[current - 1 ] == 0 ){
                flowerbed[current] = 1
                n -= 1
            }
            
            current += 1
        }
        
        
        return n == 0
    }
}