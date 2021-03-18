 func largestNumber(_ nums: [Int]) -> String {
        let number = nums.map(String.init).sorted { $0 + $1 > $1 + $0 }
        return Int(number.joined()) == 0 ? "0" : number.joined()
    }