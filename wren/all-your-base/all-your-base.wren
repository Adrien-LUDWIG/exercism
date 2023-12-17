class AllYourBase {
  static digitsToNumber(digits, base) {
    var number = 0

    var power = digits.count - 1
    for (digit in digits) {
      if (digit < 0 || base <= digit) {
        Fiber.abort("all digits must satisfy 0 <= d < input base")
      }
      number = number + digit * base.pow(power)
      power = power - 1
    }

    return number
  }

  static numberToDigits(number, base) {
    var power = 0
    while (base.pow(power + 1) <= number) power = power + 1

    var digits = []
    for (power in power..0) {
      var base_power = base.pow(power)
      var digit = (number / base_power).truncate
      number = number - digit * base_power
      digits.add(digit)
    }

    return digits
  }

  static rebase(inputBase, digits, outputBase) {
    if (inputBase < 2) Fiber.abort("input base must be >= 2")
    if (outputBase < 2) Fiber.abort("output base must be >= 2")
    var number = digitsToNumber(digits, inputBase)
    return numberToDigits(number, outputBase)
  }
}
