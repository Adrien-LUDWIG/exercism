class Darts {
  static score(x,y) {
    var norm = (x * x + y * y).sqrt
    if (norm > 10) return 0
    if (norm > 5) return 1
    if (norm > 1) return 5
    return 10 // norm <= 1
  }
}
