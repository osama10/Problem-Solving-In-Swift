class Solution {
func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
    let prerequisites = relations
    let numCourses = n
    var result = [Int]()
    var graph = Array(repeating: [Int](), count: numCourses)
    var degrees = [Int: Int]()
    var queue = [Int]()
    
    for prerequisite in prerequisites {
        let priorCourse = prerequisite[1] - 1
        let dependentCourse = prerequisite[0] - 1
        graph[priorCourse].append(dependentCourse)
        degrees[dependentCourse, default: 0] += 1
    }
    
    for course in 0..<numCourses {
        if degrees[course] == nil {
            queue.append(course)
        }
    }
    
    if queue.isEmpty { return -1 }
    var semester = 0
    
    while !queue.isEmpty {
        let count = queue.count
        
        for _ in 0..<count {
            let course = queue.removeFirst()
            result.append(course)
            
            for dependentCourse in graph[course] {
                degrees[dependentCourse, default: 0] -= 1
                if degrees[dependentCourse, default: 0] <= 0 {
                    queue.append(dependentCourse)
                }
            }
        }
        semester += 1
    }
    
    return numCourses == result.count ? semester : -1
}
}