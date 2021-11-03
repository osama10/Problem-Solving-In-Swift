class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var map = [Character: Int]()
        var bulls = 0
        var cows = 0
        
        let secret = Array(secret)
        var guess = Array(guess)
        
		// get the total count of each char
        secret.enumerated().forEach { (index, char) in
            map[char, default: 0] += 1
        }
        
		//  count bulls
        for i in 0..<guess.count {
            if secret[i] == guess[i] {
                bulls += 1
                guess[i] = "a" // converting the digit to alphabet so that it can not be counted again
                map[secret[i], default: 0] -= 1
            }
        }
       
	   // here I check if it's present increase the count
        for i in 0..<guess.count {
            if var count = map[guess[i]], count > 0 {
                cows += 1
                map[guess[i]] = count - 1
            }
        }
        
        return "\(bulls)A\(cows)B"
    }
}
