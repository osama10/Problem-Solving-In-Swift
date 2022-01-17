class Solution {
	func findRepeatedDnaSequences(_ s: String) -> [String] {
		if s.count < 10 { return [] }
		let s = Array(s)
		var start = 0
		var end = 9
		var dict = [String: Int]()

		while end < s.count {
			let dna = String(s[start...end])
			dict[dna, default: 0] += 1
			end += 1
			start += 1
		}

		return dict.filter { $0.value > 1 }.map{ $0.key }
	}
}