class Solution {
    public class Process {
        public var val: Int
        public var children: [Process]

        public init() {
            val = 0;
            children = []
        }
        
        public init(_ val: Int, _ children: [Process] = []) {
            self.val = val
            self.children = children
        }
    }

    func killProcess(_ pid: [Int], _ ppid: [Int], _ kill: Int) -> [Int] {
        var idNodeDict = [Int: Process]()

        for processId in pid {
            let node = Process(processId)
            idNodeDict[processId] = node
        }

        for (index, parentId) in ppid.enumerated() where parentId != 0 {
            let childNode = idNodeDict[pid[index]]!
            idNodeDict[parentId]?.children.append(childNode)
        }

        return findProcessToKill(idNodeDict[kill]!)
    }

    func findProcessToKill( _ root: Process) -> [Int] {
        var result = [root.val]

        guard !root.children.isEmpty else { return result }

        for childNode in root.children {
            result.append(contentsOf: findProcessToKill(childNode))
        }

        return result
    }
}