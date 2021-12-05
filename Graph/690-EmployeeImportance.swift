/**
 * Definition for Employee.
 * public class Employee {
 *     public var id: Int
 *     public var importance : Int
 *     public var subordinates: [Int]
 *     public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
 *         self.id = id
 *         self.importance = importance
 *         self.subordinates = subordinates
 *     }
 * }
 */

class Solution {
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        let employeeMap = employees.reduce(into: [Int: Employee]()) { $0[$1.id] = $1 }
         return dfs(employeeMap, id)
    }
    
    
    func dfs(_ graph: [Int: Employee], _ id: Int) -> Int {
        guard !graph[id]!.subordinates.isEmpty else { return graph[id]!.importance }
        
        var total = graph[id]!.importance
        
        for subordId in graph[id]!.subordinates {
            total += dfs(graph, subordId)
        }
        
        return total
        
    }
}
