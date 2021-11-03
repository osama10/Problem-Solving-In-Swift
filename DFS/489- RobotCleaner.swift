class Solution {
 let directions = [[-1, 0], [0, 1], [1, 0], [0, -1]] // UP, RIGHT, DOWN, LEFT

var visited = Set<String>()

func cleanRoom(_ robot: Robot) {
        dfs(0, 0, 0, robot)
}

func dfs(_ row: Int, _ col: Int, _ currentDirection: Int, _ robot: Robot) {
    let pos = "\(row)-\(col)"
    
    var currentDirection = currentDirection
    
    if !visited.contains(pos) { // if it's not visited then clean it 
        visited.insert(pos)
        
        robot.clean()
        
        for _ in 0..<4 {
            if robot.move() { // if robot can move in currentDirection then move next cell
                let nextRow = row + directions[currentDirection][0]
                let nextCol = col + directions[currentDirection][1]
                dfs(nextRow, nextCol, currentDirection, robot)
            }
			
            // once it' completely move to one direction, explore the next by turning right
			
            currentDirection = (currentDirection + 1) % 4
            robot.turnRight()

        }
    }
    
    goBack(robot) // Go back to old position to explore other paths
}

func goBack(_ robot: Robot) {
    robot.turnRight()
    robot.turnRight()
    
    robot.move()
    
    robot.turnRight()
    robot.turnRight()
}

}