 func rotateString(_ s: String, _ goal: String) -> Bool {
        s.count == goal.count && (s + s).contains(goal)
}