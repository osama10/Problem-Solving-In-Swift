import Foundation
import UIKit

/// A rectangular map consisting of N rows and M columns of square areas is given. Each area is painted with a certain color. Two areas on the map belong to the same country if the following conditions are met: The map can be described by a zero-indexed matrix A consisting of N rows and M columns of integers. The color of each area is described by the corresponding element of the matrix. Two areas have the same color if and only if their corresponding matrix elements have the same value. For example, consider the following matrix A consisting of seven rows and three columns: A[0][0] = 5 A[0][1] = 4 A[0][2] = 4 A[1][0] = 4 A[1][1] = 3 A[1][2] = 4 A[2][0] = 3 A[2][1] = 2 A[2][2] = 4 A[3][0] = 2 A[3][1] = 2 A[3][2] = 2 A[4][0] = 3 A[4][1] = 3 A[4][2] = 4 A[5][0] = 1 A[5][1] = 4 A[5][2] = 4 A[6][0] = 4 A[6][1] = 1 A[6][2] = 1 Matrix A describes a map that is colored with five colors. The areas on the map belong to eleven different countries (C1−C11), as shown in the following figure: Write a function that, given a zero-indexed matrix A consisting of N rows and M columns of integers, returns the number of different countries to which the areas of the map described by matrix A belong. For example, given matrix A consisting of seven rows and three columns corresponding to the example above, the function should return 11. ( Images can be found in resources folder ).



struct Point: Hashable {
    let x: Int
    let y: Int
}

func solution(_ graph: inout [[Int]]) -> Int {
    var totalCountries = 0
    var visited = Set<Point>()

    for row in 0..<graph.count {
        for col in 0..<graph[row].count {
            let point = Point(x: row, y: col)
            if !visited.contains(point) {
                dfs(&graph, row, col, graph[row][col], &visited)
                totalCountries += 1
            }
        }
    }
    return totalCountries
}


func dfs(_ graph: inout [[Int]], _ row: Int, _ col: Int, _ countryCode: Int, _ visited: inout Set<Point>) {

    let totalRows = graph.count
    let totalCol = graph[0].count
    let point = Point(x: row, y: col)

    if row < 0 || col < 0 || row >= totalRows || col >= totalCol  || graph[row][col] != countryCode || visited.contains(point) { return }

    visited.insert(point)

    dfs(&graph, row - 1, col, graph[row][col], &visited)
    dfs(&graph, row + 1, col, graph[row][col], &visited)
    dfs(&graph, row, col + 1, graph[row][col], &visited)
    dfs(&graph, row, col - 1, graph[row][col], &visited)

}

var graph = [
    [5, 4, 4],
    [4, 3, 4],
    [3, 2, 4],
    [2, 2, 2],
    [3, 3, 4],
    [1, 4, 4],
    [4, 1, 1]
]

solution(&graph)

print("Alles gut")
