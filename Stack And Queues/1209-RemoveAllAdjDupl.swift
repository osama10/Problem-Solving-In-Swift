class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(char: Character, count: Int)]()
        
        for char in s {
            var count = 1
            
            if let last = stack.last, last.char == char {
                count += last.count
            }
            
            stack.append((char, count))
            
            if let last = stack.last, last.count == k {
                for _ in 0..<k {
                    stack.removeLast()
                }
            }
        }
        
        return String(stack.map { $0.char })
    }
}