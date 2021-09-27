func findStrobogrammatic(_ n: Int) -> [String] {
    backtrack(n, n)
}

func backtrack(_ n: Int, _ original: Int) -> [String] {
    if n == 0 {
        return [""]
    }
    
    if n == 1 {
        return ["0", "1", "8"]
    }
    
    let prevResults = backtrack(n - 2, original)
    var result = [String]()
    
    for prevResult in prevResults {
        if n != original {
            result.append("0\(prevResult)0")
        }
        result.append("1\(prevResult)1")
        result.append("8\(prevResult)8")
        result.append("6\(prevResult)9")
        result.append("9\(prevResult)6")

    }
    
    return result
}