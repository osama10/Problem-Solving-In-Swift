import Foundation

func intToRoman(_ num: Int) -> String {
    let  baseNum = [1, 4, 5, 9, 10, 40, 50, 90,
               100, 400, 500, 900, 1000]
    let  symbols = ["I", "IV", "V", "IX", "X", "XL",
               "L", "XC", "C", "CD", "D", "CM", "M"]

    var index = baseNum.count - 1

    var num = num
    var romanNumber = ""

    while num > 0 && index >= 0 {
        var div = num / baseNum[index]
        num %= baseNum[index]

        while div > 0 {
            romanNumber += symbols[index]
            div -= 1
        }

        index -= 1
    }

    return romanNumber
}

intToRoman(300)

let num = 1994

let m = [ "", "M", "MM", "MMM" ]
let c = [ "", "C", "CC", "CCC", "CD", "D","DC", "DCC", "DCCC", "CM"]
let x = [ "", "X", "XX", "XXX", "XL", "L","LX", "LXX", "LXXX", "XC" ]
let i = [ "", "I", "II", "III", "IV", "V","VI", "VII", "VIII", "IX"]

let thousand = m[num / 1000]
let hundred = c[ ((num%1000) / 100)]
let ten = x[ ((num%100) / 10)]
let one = i[((num%10))]

let result = thousand + hundred + ten + one
