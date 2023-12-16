class Number {
  static countDigits(n) {
    var count = 0

    while (n > 0) {
      count = count + 1
      n = (n / 10).truncate
    }

    return count
  }

  static sumOfDigitsPower(n, power) {
    var sum = 0

    while (n > 0) {
      sum = sum + (n % 10).pow(power)
      n = (n / 10).truncate
    }

    return sum
  }

  static isArmstrong(n) { n == sumOfDigitsPower(n, countDigits(n))}
}
