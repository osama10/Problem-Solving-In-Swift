class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        let trie = Trie()

        for num in 1...n {
            trie.addNum(num)
        }

        return trie.sortLexographically()
    }

   class TrieNode {
        var key: Int?
        var children: [TrieNode?] = Array(repeating: nil, count: 11)
        var num = 0

        func add(_ digit: Int) -> TrieNode {
            guard children[digit] == nil else { return children[digit]! }
            let node = TrieNode()
            node.key = digit
            children[digit] = node
            return node
        }

        func find(_ digit: Int) -> TrieNode? {
            children[digit]
        }
    }

    class Trie {
        var root = TrieNode()

        func addNum(_ num: Int) {
            var curr = root

            for char in String(num) {
                if let digit = Int(String(char)) {
                    curr = curr.add(digit)

                }
            }

            curr.num = num
        }

        func sortLexographically() -> [Int] {
            getNums(root)
        }

        func getNums(_ root: TrieNode) -> [Int] {
            var result = [Int]()

            if root.num != 0 {
                result.append(root.num)
            }

            for child in root.children where child != nil {
                result.append(contentsOf: getNums(child!))
            }

            return result
        }
    }
}