/**
 * // This is ArrayReader's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class ArrayReader {
 *     public func get(_ index: Int) -> Int {}
 * }
 */

class Solution {
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        if reader.get(0) == target { return 0 }
        
        var left = 0
        var right = 1
        
        while reader.get(right) < target {
            left = right
            right *= 2
        }
        
        while left <= right {
            let mid = left + (right - left) / 2
            let value = reader.get(mid)
           
            if value == target { return mid }
            if value < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
}