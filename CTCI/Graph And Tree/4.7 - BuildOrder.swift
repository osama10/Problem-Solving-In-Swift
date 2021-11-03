/// 4.7 Build Order: You are given a list of projects and a list of dependencies (which is a list of pairs of projects,wherethesecondprojectisdependentonthefirstproject).Allofaproject'sdependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.

func buildOrder(projects: [String], dependencies : [[String]]) -> [String] {
    var dependencyGraph = [String: [String]]()
    projects.forEach {  dependencyGraph[$0] = [] }
    var inDegree = [String: Int]()
    var projectOrder = [String]()
    var stack = [String]()
    
    dependencies.forEach { dependency in
        let dependent = dependency[1]
        let dependee = dependency[0]
        dependencyGraph[dependee]?.append(dependent)
        inDegree[dependent, default: 0] += 1
    }
    
    if inDegree.count == projects.count { return [] }
    
    projects.forEach { project in
        if inDegree[project, default: 0] == 0 {
            stack.append(project)
        }
    }
    
    while !stack.isEmpty {
        let project = stack.removeFirst()
        projectOrder.append(project)
        
        for dependentProject in dependencyGraph[project]! {
            inDegree[dependentProject, default: 0] -= 1
            
            if inDegree[dependentProject, default: 0] == 0 {
                stack.append(dependentProject)
            }
        }
    }
    
    return projectOrder.count == projects.count ? projectOrder : []
}

buildOrder(projects: ["a", "b", "c", "d", "e", "f" ], dependencies: [["a", "d"], ["f", "b"], ["b", "d"], ["f", "a"], ["d","c"]])
