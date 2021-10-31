//typealias Task = (task: Character, freq: Int)
//
//func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
//    if n == 0  { return tasks.count }
//
//    let taskFreqTable = tasks
//        .reduce(into: [Character: Int]()){ $0[$1, default: 0] += 1 }
//
//    var heap = Heap<Task> { $0.freq > $1.freq }
//    var totalCycles = 0
//
//    for (task, freq) in taskFreqTable {
//        heap.insert((task, freq))
//    }
//
//    while !heap.isEmpty {
//        var waitingTasks = [Task]()
//        var count = n + 1
//
//        while count > 0, let task = heap.remove() {
//            totalCycles += 1
//            count -= 1
//            if task.freq - 1 > 0 {
//                waitingTasks.append(Task(task.task, task.freq - 1))
//            }
//        }
//
//        heap.insert(waitingTasks)
//
//        if !heap.isEmpty {
//            totalCycles += count
//        }
//    }
//
//    return totalCycles
//}
//
//leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2)
//
//func findRightInterval(_ intervals: [[Int]]) -> [Int] {
//    var endIntervals = intervals
//        .enumerated()
//        .map {(offset: $0.offset, val: $0.element[1])}
//        .sorted{ $0.val < $1.val }
//
//    var startIntervals = intervals
//        .enumerated()
//        .map {(offset: $0.offset, val: $0.element[0])}
//        .sorted{ $0.val < $1.val }
//
//    var result = Array(repeating: -1, count: intervals.count)
//
//    for _ in 0..<intervals.count {
//        let interval = endIntervals.removeLast()
//
//        if let start = startIntervals.last,
//            start.val >= interval.val {
//            var possibleNextInterval = startIntervals.removeLast()
//            while let start = startIntervals.last, start.val >= interval.val {
//                possibleNextInterval = startIntervals.removeLast()
//            }
//            result[interval.offset] = possibleNextInterval.offset
//            startIntervals.append(possibleNextInterval)
//        }
//    }
//
//    return result
//}
//
//
//findRightInterval([[1,4],[2,3],[3,4]])
//
//func findAnagrams(_ s: String, _ p: String) -> [Int] {
//    var patternCount = Array(repeating: 0, count: 26)
//    var targetCount =  Array(repeating: 0, count: 26)
//    var start = 0
//    let s = Array(s)
//    var result = [Int]()
//
//    for char in p {
//        let index = getIndex(char)
//        patternCount[index] += 1
//    }
//
//    for (end, char) in s.enumerated() {
//        let index = getIndex(char)
//        targetCount[index] += 1
//
//        if end >= p.count {
//            let indexToRemoveCount = getIndex(s[start])
//            targetCount[indexToRemoveCount] -= 1
//            start += 1
//        }
//
//        if targetCount.elementsEqual(patternCount) {
//            result.append(start)
//        }
//    }
//
//    return result
//
//}
//
//func getIndex(_ char: Character) -> Int {
//    Int(char.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
//}
//
//func checkInclusion(_ s1: String, _ s2: String) -> Bool {
//    var targetCharFreq = s1
//        .reduce(into: [Character: Int]())
//    { $0[$1, default: 0] += 1}
//    var start = 0
//    var matched = 0
//    let s2 = Array(s2)
//
//    for (end, char) in s2.enumerated() {
//
//        if let freq = targetCharFreq[char] {
//            targetCharFreq[char] = freq - 1
//            if freq - 1 == 0 { matched += 1}
//        }
//
//        if matched == targetCharFreq.keys.count {
//            return true
//        }
//
//        if end >= s1.count - 1 {
//            let charToRemove = s2[start]
//            start += 1
//            if let freq = targetCharFreq[charToRemove] {
//                targetCharFreq[charToRemove] = freq + 1
//                if freq == 0 {
//                    matched -= 1
//                }
//            }
//        }
//    }
//
//    return false
//}
//
//func findOriginalArray(_ changed: [Int]) -> [Int] {
//     let changed = changed.sorted()
//     var numFreqTable = changed.reduce(into: [Int: Int]()){ $0[$1, default: 0] += 1 }
//     if changed.count % 2 == 1 { return [] }
//
//    var result = [Int]()
//
//     for num in changed {
//         if numFreqTable[num] == nil { continue }
//
//         guard let numFreq = numFreqTable[num],
//               let doubleFreq = numFreqTable[2 * num]
//             else { return [] }
//
//         result.append(num)
//         numFreqTable[num] = numFreq - 1 == 0 ? nil : numFreq - 1
//
//         if numFreqTable[ 2 * num]  == nil { return [] }
//         numFreqTable[ 2 * num]  = doubleFreq - 1 == 0 ? nil : doubleFreq - 1
//     }
//
//     return result.count == (changed.count / 2) ? result : []
// }
//
//findOriginalArray([1,3,4,2,6,8])
//
//
//import Foundation
//import UIKit
//
//let cats = ["http://thecatapi.com/api/images/get",
//            "http://thecatapi.com/api/images/get",
//            "http://thecatapi.com/api/images/get"]
//
//var images = [UIImage]()
//
//let group = DispatchGroup()
//
//
//
//
//let queue1 = DispatchQueue(label: "queue1")
//
//
//
//queue1.async(group: group) {
//    for cat in cats {
//        guard let url = URL(string: cat) else { continue }
//        group.enter()
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            defer { group.leave() }
//            if error == nil,
//                let data = data,
//                let image = UIImage(data: data) {
//                  images.append(image)
//            }
//
//        }
//        task.resume()
//    }
//}
//
//group.notify(queue: queue1) {
//    print("cat images")
//    images[0]
//}
//
//print("asda")
//
//
//var count = 0
//var _count: Int {
//    get {
//        queue1.sync {
//            count
//        }
//    }
//    set {
//        queue1.sync {
//            count = newValue
//        }
//    }
//}

//import UIKit
//
//func findParent(_ viewA: UIView, _ viewB: UIView) -> UIView? {
//    var a: UIView? = viewA
//    var b: UIView? = viewB
//
//    while a !== b {
//        a = a == nil ? viewB : a?.superview
//        b = b == nil ? viewA : b?.superview
//    }
//
//    return a
//}
//
//
//class View: UIView {
//
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        guard isUserInteractionEnabled,
//              alpha >= 0.01,
//              !isHidden,
//              self.point(inside: point, with: event) else { return nil }
//
//        for subview in subviews {
//            let candidate = subview.convert(point, from: self)
//            if let view = subview.hitTest(candidate, with: event) {
//                return view
//            }
//        }
//
//        return self
//    }
//}
//
//struct Car {
//  var model = "M3"
//}
//
//class Ref<T> {
//    var value: T
//    init(_ value: T) {
//        self.value = value
//    }
//}
//
//struct Box<T> {
//    var ref: Ref<T>
//
//    var value: T {
//        get { ref.value }
//        set {
//            if !isKnownUniquelyReferenced(&ref) {
//                ref = Ref(newValue)
//            } else {
//                ref.value = newValue
//            }
//        }
//    }
//
//    init(_ val: T) {
//        ref = Ref(val)
//    }
//
//}
//
//var val = Box(Car())
//withUnsafePointer(to: &val.value) { print("\($0)") }
//
//var val1 = val
//withUnsafePointer(to: &val1.value) { print("\($0)") }
//
//val1.value = Car(model: "1312")
//withUnsafePointer(to: &val1.value) { print("\($0)") }
//

var islands = [[(row: Int, col: Int)]]()

func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
    var grid2 = grid2
    
    for row in 0..<grid2.count {
        for col in 0..<grid2[0].count {
            if grid2[row][col] == 1 {
                var island = [(row: Int, col: Int)]()
                dfs(&grid2, row, col, &island)
                islands.append(island)
            }
        }
    }
    
    var subIslands = 0
    
    for island in islands {
        var isSubIsland = true
        
        for area in island {
            if !isIsland(grid1, area.row, area.col) {
                isSubIsland = false
                break
            }
        }
        
        if isSubIsland {
            subIslands += 1
        }
    }

    return subIslands
    
}

func isIsland(_ grid: [[Int]], _ row: Int, _ col: Int) -> Bool {
     if row < 0
    || row >= grid.count
    || col < 0
    || col >= grid[0].count
    || grid[row][col] == 0 { return false }
    
    return true
}

func dfs(_ grid: inout [[Int]],
         _ row: Int,
         _ col: Int,
         _ island: inout[(row: Int, col: Int)]) {
    if row < 0
    || row >= grid.count
    || col < 0
    || col >= grid[0].count
    || grid[row][col] == 0 { return }
    
    grid[row][col] = 0
    
    island.append((row, col))
    
    dfs(&grid, row + 1, col, &island)
    dfs(&grid, row - 1, col, &island)
    dfs(&grid, row, col + 1, &island)
    dfs(&grid, row, col - 1, &island)
}

let grid1 = [[1,1,1,1,0,0],[1,1,0,1,0,0],[1,0,0,1,1,1],[1,1,1,0,0,1],[1,1,1,1,1,0],[1,0,1,0,1,0],[0,1,1,1,0,1],[1,0,0,0,1,1],[1,0,0,0,1,0],[1,1,1,1,1,0]]
let grid2 = [[1,1,1,1,0,1],[0,0,1,0,1,0],[1,1,1,1,1,1],[0,1,1,1,1,1],[1,1,1,0,1,0],[0,1,1,1,1,1],[1,1,0,1,1,1],[1,0,0,1,0,1],[1,1,1,1,1,1],[1,0,0,1,0,0]]

countSubIslands(grid1, grid2)
