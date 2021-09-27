typealias Tree = [String: [String]]
var smallestRegion = ""

func createTree(_ regions: [[String]]) -> Tree {
    var result = Tree()
    
    for region in regions {
        result[region[0]] = Array(region.dropFirst())
    }
    
    return result
}

func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
    let tree = createTree(regions)
    smallestCommonRegion(tree, regions[0][0], region1, region2)
    return smallestRegion
}

func smallestCommonRegion(_ tree: Tree, _ root: String ,_ region1: String, _ region2: String) -> Bool {
   // guard tree[root] != nil else { return false }
    var count = 0
    
    for region in tree[root, default: []] {
        count += smallestCommonRegion(tree, region, region1, region2) ?  1 : 0
    }
    
    count += (root == region1 || root == region2) ? 1 : 0
    print(root, count)
   
    if tree[root] != nil && count >= 2 {
        smallestRegion = root
        return true
    }
    
    return count == 1
}


findSmallestRegion([["feuN","ycZFp","hl","lQ"],["ycZFp","vRLiU"]],
                   "hl",
                   "vRLiU")
