import Foundation

/// https://www.geeksforgeeks.org/disjoint-set-data-structures/

class DisjointSet {
    var parent: [Int] = []
    var rank: [Int]

    init(_ totalElements: Int) {
        rank = Array(repeating: 1, count: totalElements)
        (0...totalElements).forEach { parent.append($0) }
    }

    func find(_ element: Int) -> Int {
        if parent[element] == element {
            return element
        }
        return find(parent[element])
    }


    func union(_ element1: Int, _ element2: Int) {

        let element1Rep = find(element1)
        let element2Rep = find(element2)

        if element1Rep == element2Rep { return }

        if rank[element1Rep] < rank[element2Rep] { parent[element1Rep] = element2Rep }
        else if rank[element1Rep] > rank[element2Rep] { parent[element2Rep] = element1Rep }
        else {
            parent[element1Rep] = element2Rep
            rank[element2Rep] += 1
        }
    }

    func areElementsInSameSet(_ element1: Int, _ element2: Int) {
        print(find(element1) == find(element2) ? "Yes" : "No")
    }
}


/// https://www.codechef.com/problems/CD1IT5


func runTestCases(_ n: Int, q: Int, queries: [[Int]]) {
    let islands = DisjointSet(n)

    queries.forEach { query in
        let element1 = query[1] - 1
        let element2 = query[2] - 1
        if query[0] == 0 {
            islands.union(element1, element2)
        } else if query[0] == 1 {
            islands.areElementsInSameSet(element1, element2)
        }
    }
}

runTestCases(5, q: 7, queries: [[0, 1, 2], [1,2,1], [0,3,4],[1,1,4], [0,3,2], [1,2,3], [1,1,4]])
