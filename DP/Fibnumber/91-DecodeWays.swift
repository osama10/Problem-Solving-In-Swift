    func numDecodings(_ s: String) -> Int {
    var memo = [Int: Int]()
    return numDecodings(s.map{ String($0) }, 0, &memo)
}

func numDecodings(_ s: [String], _ index: Int, _ memo: inout [Int: Int]) -> Int {
    if index == s.count {
        return 1
    }
    
    if let value = memo[index] {
        return value
    }
    
    if s[index] == "0" {
        return 0
    }
    
    if index == s.count - 1 {
        return 1
    }
    
    var count = numDecodings(s, index + 1, &memo)
    
    if let num = Int(s[index] + s[index + 1]), num <= 26 {
        count += numDecodings(s, index + 2, &memo)
    }
    
    memo[index] = count
    return count
}