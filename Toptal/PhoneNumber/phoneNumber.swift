func getPhoneNumber(_ string: String) -> String {
    let numbers = string.filter { $0.isNumber }
    var phoneNumber = ""
    
    for (index, num) in numbers.enumerated() {
        if index != 0 && (index) % 3 == 0 {
            phoneNumber.append("-")
        }
        
        phoneNumber.append(num)
    }
    
    return phoneNumber
}