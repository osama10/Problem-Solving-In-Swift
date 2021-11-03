func getName(_ names: [String], _ numbers: [String], _ prefix: String) -> String {
    var numberDict = [(number: String, name: String)]()
    
    for i in 0..<numbers.count {
        numberDict.append((numbers[i], names[i]))
    }
    
    numberDict.sort { $0.name < $1.name }
    
    for entry in numberDict {
        if entry.number == prefix || entry.number.contains(prefix){
            return entry.name
        }
    }
    
    return "NO CONTACT"
}


getName(["pim", "pom"], ["999999999", "777888999"], "88999")
getName(["sander", "amy", "ann", "michael"], ["123456789", "234567890", "789123456", "123123123"], "1")
