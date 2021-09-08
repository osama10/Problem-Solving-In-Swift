
/*
 Given a string s, return the number of substrings that have only one distinct letter.

 Example 1:

 Input: s = "aaaba"
 Output: 8
 Explanation: The substrings with one distinct letter are "aaa", "aa", "a", "b".
 "aaa" occurs 1 time.
 "aa" occurs 2 times.
 "a" occurs 4 times.
 "b" occurs 1 time.
 So the answer is 1 + 2 + 4 + 1 = 8.
 
 Example 2:

 Input: s = "aaaaaaaaaa"
 Output: 55
 */

func countLetters(_ s: String) -> Int {
    let s = Array(s)
    var distinctSubstring = Array(repeating: 0, count: s.count)
    distinctSubstring[0] = 1
    var total = 1
   
    for index in 1..<s.count {
        distinctSubstring[index] = s[index - 1] == s[index]
            ? distinctSubstring[index - 1] + 1
            : 1
       total += distinctSubstring[index]
    }
    
    return total
}

countLetters("aaaaaaaaaa")
