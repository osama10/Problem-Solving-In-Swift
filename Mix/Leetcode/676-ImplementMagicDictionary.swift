
class MagicDictionary {
    var dict = Set<String>()
   
    
    func buildDict(_ dictionary: [String]) {
        dictionary.forEach{ dict.insert($0) }
    }
    
    func search(_ searchWord: String) -> Bool {
        
       
        for word in dict {
            if word.count == searchWord.count {
                if checkIFOnlyOneChangeIsRequired(word, searchWord ) { return true }
            }
        }
        
        return false
    }
    
    func checkIFOnlyOneChangeIsRequired(_ str1: String, _ str2: String) -> Bool {
      
        var str1 = str1
        var str2 = str2
        
        var differentCharFound = false
        
        while !str1.isEmpty  && !str2.isEmpty  {
            if str1.removeLast() != str2.removeLast() {
                if !differentCharFound { differentCharFound = true }
                else { return false }
            }
        }
        
        return differentCharFound
    }
}