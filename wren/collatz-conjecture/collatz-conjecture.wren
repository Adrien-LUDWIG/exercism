class Collatz {
  static steps(n) {
    if (n <= 0) Fiber.abort("Only positive integers are allowed")

    var count = 0

    while (n != 1) {
      n = n % 2 == 0 ? n / 2 : 3 * n + 1
      count = count + 1
    }

    return count
  }
}
