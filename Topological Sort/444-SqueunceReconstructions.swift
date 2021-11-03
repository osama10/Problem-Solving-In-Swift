func sequenceReconstruction(_ org: [Int], _ seqs: [[Int]]) -> Bool {
       guard !org.isEmpty,
             !seqs.isEmpty
       else { return false }
       
       var indegree = [Int: Int]()
       var graph = [Int: [Int]]()
       var queue = [Int]()
       var result = [Int]()
       
       // build graph
       for seq in seqs {
           for node in seq {
                graph[node] = []
                indegree[node] = 0
           }
        }
       
       // building connections
       for seq in seqs {
           for i in 0..<seq.count-1 {
               let source = seq[i]
               let dep = seq[i + 1]
               if graph[source] == nil || graph[dep] == nil { return false }
               graph[source]!.append(dep)
               indegree[dep, default: 0] += 1
           }
       }
       
       if indegree.count != org.count { return false }
       
       for node in graph.keys {
           if indegree[node, default: 0] == 0 {
               queue.append(node)
           }
       }
      
       while !queue.isEmpty {
           if queue.count > 1 { return false }
           let node = queue.removeLast()
           result.append(node)
          
           for dep in graph[node]! {
               
               indegree[dep, default: 0] -= 1
               
               if indegree[dep, default: 0] == 0 {
                   queue.append(dep)
               }
           }
       }
       
       return   result == org
   }
