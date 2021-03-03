import Foundation

/// 1267
//func countServers(_ grid: [[Int]]) -> Int {
//    if grid.count == 1 { return 1 }
//    var grid = grid
//    var totalConnectedNodes = 0
//    let totalRow = grid.count
//    let totalCol = grid[0].count
//
//    for row in 0..<totalRow {
//        for col in 0..<totalCol {
//            if grid[row][col] == 1 {
//                //let initialTotalConnectedNodes = totalConnectedNodes
//                depthFirstSearch(&grid, row, col, &totalConnectedNodes, totalRow, totalCol, false)
//                //if initialTotalConnectedNodes != totalConnectedNodes { totalConnectedNodes += 1 }
//            }
//        }
//    }
//
//    return totalConnectedNodes
//}
//
//func depthFirstSearch(_ graph: inout [[Int]], _ row: Int, _ col: Int ,_ totalConnectedNodes: inout Int, _ totalRow: Int, _ totalCol: Int, _ hasNegibor: Bool) {
//
//    if row < 0 || col < 0 || row >= totalRow || col >= totalCol || graph[row][col] != 1  {  return }
//
//    if hasNegibor { totalConnectedNodes += 1 }
//    graph[row][col] = -1
//
//    depthFirstSearch(&graph, row - 1, col, &totalConnectedNodes, totalRow, totalCol, true)
//    depthFirstSearch(&graph, row + 1, col, &totalConnectedNodes, totalRow, totalCol, true)
//    depthFirstSearch(&graph, row, col - 1, &totalConnectedNodes, totalRow, totalCol, true)
//    depthFirstSearch(&graph, row, col + 1, &totalConnectedNodes, totalRow, totalCol, true)
//
//    graph[row][col] = 1
//}
//
//
//countServers([[1,0],[1,1]])

struct PositiveReview: Hashable {
    let userID: Int
    let businessID: Int
}


func mostSimilarBusiness(businessOfInterestID: Int,
                         positiveReviews: [PositiveReview]) -> Int {

    var result = (buisness: 0, similarity: Int.min)

    var mapOfUserId = [Int :Set<Int>]()
    positiveReviews.forEach { review in
        if mapOfUserId[review.businessID] != nil {
            mapOfUserId[review.businessID]?.insert(review.userID)
        } else {
            mapOfUserId[review.businessID] = Set<Int>()
            mapOfUserId[review.businessID]?.insert(review.userID)
        }
    }

    for key in mapOfUserId.keys {
        if key != businessOfInterestID {
            let intrestBuisness = mapOfUserId[businessOfInterestID]!
            let mostSimialrCand = mapOfUserId[key]!
            let similarity = intrestBuisness.intersection(mostSimialrCand).count * 100 / intrestBuisness.union(mostSimialrCand).count
            if result.similarity < similarity{
                result = (key, similarity)
            }
        }

    }

    return result.buisness
}


