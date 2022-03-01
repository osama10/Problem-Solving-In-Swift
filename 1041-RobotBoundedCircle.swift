class Solution {
    typealias Position = (x: Int, y: Int)
    
    enum Direction {
        case north, south, east, west
    }
    
    func isRobotBounded(_ instructions: String) -> Bool {
        
        var direction = Direction.north
        var pos = Position(x:0, y: 0)
        
        for _ in 1...4 {
            for instruction in instructions {
                if instruction == "G" {
                    pos = getNextPos(pos, direction)
                } else if instruction == "L" {
                    direction = getNewPostionWhenRobotTurnLeft(direction)
                } else {
                    direction = getNewPostionWhenRobotTurnRight(direction)
                }
            }
        }
        
        return pos.x == 0 && pos.y == 0
    }
    
    
    func getNextPos(_ currPos: Position, _ direction: Direction) -> Position {
        switch direction {
            case .north: return (currPos.x, currPos.y + 1)
            case .south: return (currPos.x, currPos.y - 1)
            case .east: return (currPos.x + 1, currPos.y)
            case .west: return (currPos.x - 1, currPos.y)
        }
    }
    
    func getNewPostionWhenRobotTurnLeft(_ direction: Direction) -> Direction {
         switch direction {
            case .north: return .west
            case .south: return .east
            case .east: return .north
            case .west: return .south
        }
    }
    
     func getNewPostionWhenRobotTurnRight(_ direction: Direction) -> Direction {
         switch direction {
            case .north: return .east
            case .south: return .west
            case .east: return .south
            case .west: return .north
        }
    }
}