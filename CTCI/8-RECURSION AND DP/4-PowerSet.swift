/// 8.4 Power Set: Write a method to return all subsets of a set.

func powerSet(arr: [Int]) -> [[Int]] {
    var comb = [Int]()
    var allComb = [[Int]]()
    generate(arr: arr, comb: &comb, allComb: &allComb, start: 0)
    return allComb
}


func generate(arr: [Int], comb: inout [Int], allComb: inout[[Int]], start: Int) {
    allComb.append(comb)

    for next in start..<arr.count {
        comb.append(arr[next])
        generate(arr: arr, comb: &comb, allComb: &allComb, start: next + 1)
        comb.removeLast()
    }

}

powerSet(arr: [1, 2])
powerSet(arr: [1, 2, 3])
