func minNum(_ num: Int) -> Int {
    var numArr = [Int]()
    var num = num
    
    while num != 0 {
        numArr.append( num % 10 )
        num /= 10
    }
    
    var num1 = 0
    var num2 = 0
    
    numArr.sort()
    
    for i in stride(from: 0, to: numArr.count, by: 2) {
        num1 = num1 * 10 + numArr[i]
    }
    
    for i in stride(from: 1, to: numArr.count, by: 2) {
        num2 = num2 * 10 + numArr[i]
    }
    
    return num1 + num2
}


minNum(4523) // 59
minNum(98435) // 407
minNum(713451) // 282
