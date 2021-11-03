/**
 * // This is the Master's API interface.
 * // You should not implement it, or speculate about its implementation
 * class Master {
 *     public func guess(word: String) -> Int {}
 * }
 */
class Solution {
    func findSecretWord(_ wordlist: [String], _ master: Master) {
    
        var wordList = wordlist
        var currWord = wordList.removeFirst()
        var matched = master.guess(currWord)
        var guesses = 1
        
        while guesses < 10 {
            if matched == 6 { break }
            
             wordList = wordList
            .map { (findMatchCount($0, currWord), $0) }
            .filter { $0.0 == matched }
            .map { $0.1 }
            
            guard !wordList.isEmpty else { break }
            
            currWord = wordList.randomElement()!
            matched = master.guess(currWord)
            
            guesses += 1
        }
    }
    
    func findMatchCount(_ word: String, _ target: String) -> Int {
        var count = 0
        
        for (charA, charB) in zip(word, target) {
            if charA == charB {
                count += 1
            }
        }
        
        return count
    }

}
