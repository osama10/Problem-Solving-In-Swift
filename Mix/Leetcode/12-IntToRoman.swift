/// 12 

func intToRoman( _ number: Int) -> String {
    let numbers = [1, 4, 5, 9, 10, 40, 50, 90,
                 100, 400, 500, 900, 1000]
      let  symbols = ["I", "IV", "V", "IX", "X", "XL",
                 "L", "XC", "C", "CD", "D", "CM", "M"]

    var index = numbers.count - 1
    var num = number
    var result = ""

    while index >= 0 && num > 0 {
        let freq = num / numbers[index]
        num %=  numbers[index]
        result += String(repeating: symbols[index], count: freq)
        index -= 1
    }

    return result
}
