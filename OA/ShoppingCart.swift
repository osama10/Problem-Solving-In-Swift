func foo(codeList: [String], shoppingCart: [String]) -> Int {
    let shoppingPattern = codeList.map { $0.split(separator:" ").map(String.init) }
    
    var indexOfPattern = 0
    var indexOfCart = 0
    
    while indexOfCart < shoppingCart.count && indexOfPattern < shoppingPattern.count {
        
        if shoppingPattern[indexOfPattern][0] == "anything" || shoppingCart[indexOfCart] == shoppingPattern[indexOfPattern][0] {
            if shoppingPattern[indexOfPattern].count == 1 {
                indexOfPattern += 1
            } else {
                 var patternMatched = true

                for (index, food) in shoppingPattern[indexOfPattern].enumerated() {
                    let tempIndex = indexOfCart + index
                    
                    if food == "anything" { continue }
                    
                    if tempIndex >= shoppingCart.count || food != shoppingCart[tempIndex] {
                        patternMatched = false
                        break
                    }
            }
               
                if patternMatched {
                    indexOfCart += shoppingPattern[indexOfPattern].count - 1
                    indexOfPattern += 1
                }
            }
        
        }
            
        indexOfCart += 1
        
        
    }
    
    return indexOfPattern == shoppingPattern.count ? 1 : 0
}


var codeList = ["orange", "apple apple", "bannna", "orange apple bannna"]
var shoppingCart = ["orange", "apple", "apple", "bannna", "orange", "apple", "bannna"]

foo(codeList: codeList, shoppingCart: shoppingCart) //  1

codeList = [ "apple apple", "apple apple bannna",]
shoppingCart = [ "apple", "apple", "apple", "bannna"]

foo(codeList: codeList, shoppingCart: shoppingCart) // 0

codeList = [ "apple apple", "bannna anything bannna",]
shoppingCart = [ "apple", "apple", "apple", "bannna"]

foo(codeList: codeList, shoppingCart: shoppingCart) // 0

codeList = [ "apple apple", "bannna anything bannna",]
shoppingCart = [ "orange", "apple", "apple", "bannna", "orange", "bannna"]

foo(codeList: codeList, shoppingCart: shoppingCart) // 1