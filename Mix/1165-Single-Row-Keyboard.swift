/*
 There is a special keyboard with all keys in a single row.

 Given a string keyboard of length 26 indicating the layout of the keyboard (indexed from 0 to 25). Initially, your finger is at index 0. To type a character, you have to move your finger to the index of the desired character. The time taken to move your finger from index i to index j is |i - j|.

 You want to type a string word. Write a function to calculate how much time it takes to type it with one finger.
 
 Example 1:

 Input: keyboard = "abcdefghijklmnopqrstuvwxyz", word = "cba"
 Output: 4
 Explanation: The index moves from 0 to 2 to write 'c' then to 1 to write 'b' then to 0 again to write 'a'.
 Total time = 2 + 1 + 1 = 4.
 Example 2:

 Input: keyboard = "pqrstuvwxyzabcdefghijklmno", word = "leetcode"
 Output: 73
 
 
 */
 
func calculateTime(_ keyboard: String, _ word: String) -> Int {
    let keyboard = keyboard.enumerated().reduce(into: [Character: Int]()) { partialResult, element in
        partialResult[element.element] = element.offset
    }
    
    var time = 0
    var lastIndex = 0
    
    word.forEach { char in
        let currentIndex = keyboard[char]!
        time += abs(currentIndex - lastIndex)
        lastIndex = currentIndex
    }
    
    return time
}

calculateTime("abcdefghijklmnopqrstuvwxyz", "cba")
