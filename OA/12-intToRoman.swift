class Solution {
    func intToRoman( _ number: Int) -> String {

          let numbers = [1, 4, 5, 9,
                         10, 40, 50, 90,
                         100, 400, 500, 900,
                         1000]

          let  symbols = ["I", "IV", "V", "IX",
                          "X", "XL", "L", "XC",
                          "C", "CD", "D", "CM",
                          "M"]

        var roman = ""
        var number = number

        for index in stride(from: numbers.count - 1, to: -1, by: -1) {
            let freq = number / numbers[index]
            number = number % numbers[index]
            let romanSymbols = String(repeating: symbols[index],
                                      count: freq)
            roman.append(romanSymbols)
        }

        return roman
    }
}