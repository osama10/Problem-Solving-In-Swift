import Foundation

/*:
 8.1 A child is running up a staircase with n steps and can hop either 1, 2, or 3 steps at a time. 
 Count the number of ways the child can run up the stairs.
 */

func countWays(steps: Int) -> Int {
    var cache : [Int?] = Array(repeating: nil, count: steps + 1)
    return countWays(steps, &cache)
}


func countWays(_ steps: Int, _ cache: inout [Int?]) -> Int {
    if steps <= 0 { return steps == 0 ? 1 : 0 }
    
    if let numOfWays = cache[steps] { return numOfWays }
    
    let way1 = countWays( steps - 1,  &cache)
    let way2 = countWays( steps - 2, &cache)
    let way3 = countWays( steps - 3,  &cache)

    
    cache[steps] = way1 + way2 + way3
   
    return cache[steps]!
}

assert(countWays(steps: 5) == 13)
assert(countWays(steps: 3) == 4)