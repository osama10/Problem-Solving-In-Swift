func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    var lo = 1
    var hi = piles.max() ?? 0
    
    while lo < hi {
        let mid = (lo + hi) / 2
        if  isPossibile(mid,piles, h) {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    
    return lo
}

func isPossibile(_ speed: Int, _ piles: [Int],_  k: Int) -> Bool {
    guard speed > 0 else { return false }
   
    var count = 0
    
    for bananas in piles {
        count = count + bananas / speed
        if bananas % speed != 0 { count += 1 }
    }
    
    return count <= k
}