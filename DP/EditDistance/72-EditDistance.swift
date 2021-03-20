/// 72 https://www.youtube.com/watch?v=Xxx0b7djCrs
func minDistance(_ word1: String, _ word2: String) -> Int {
    let word1 = Array(word1)
    let word2 = Array(word2)

    var cache = Array(repeating: Array(repeating: -1, count: word2.count + 1), count: word1.count + 1)

    return mindEditDistance(word1, word2, word1.count, word2.count, &cache)
}

func mindEditDistance(_ word1: Array<String.Element>, _ word2: Array<String.Element>, _ n: Int, _ m : Int, _ cache: inout [[Int]]) -> Int {

    if n == 0 { return m }
    if m == 0 { return n }

    if cache[n][m] != -1 { return cache[n][m] }

    if word1[n - 1] == word2[m - 1] { cache[n][m] = mindEditDistance(word1, word2, n-1, m-1, &cache) }
    else {
        cache[n][m] = 1 + min(mindEditDistance(word1, word2, n-1, m-1, &cache), // sub
                          min(mindEditDistance(word1, word2, n, m-1, &cache), // insert
                              mindEditDistance(word1, word2, n-1, m, &cache)) // delete
                          )
    }

    return cache[n][m]
}