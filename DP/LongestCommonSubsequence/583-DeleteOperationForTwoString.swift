// 583
func minDistance(_ word1: String, _ word2: String) -> Int {
        var dp = Array(repeating: Array(repeating: -1, count: word2.count + 1), count: word1.count + 1)
        let word1 = Array(word1), word2 = Array(word2)
        let lcs = lcsUtil(word1, word2, word1.count, word2.count, &dp)
        return word1.count + word2.count - (2 * lcs)
}
    
func lcsUtil(_ text1: Array<Character>, _ text2: Array<Character>, _ p1: Int, _ p2: Int, _ cache: inout [[Int]] ) -> Int {
    if p1 == 0 || p2 == 0 { return 0 }
    if cache[p1][p2] != -1 { return cache[p1][p2] }
    if text1[p1 - 1] == text2[p2 - 1] { cache[p1][p2] = 1 + lcsUtil(text1, text2, p1 - 1, p2 - 1, &cache) }
    else { cache[p1][p2] = max(lcsUtil(text1, text2, p1 - 1, p2, &cache), lcsUtil(text1, text2, p1, p2 - 1, &cache)) }
    return cache[p1][p2]
}