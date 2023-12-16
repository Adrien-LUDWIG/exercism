import "random" for Random

class Character {
  construct new() {
    _strength = Character.rollAbility()
    _dexterity = Character.rollAbility()
    _constitution = Character.rollAbility()
    _intelligence = Character.rollAbility()
    _wisdom = Character.rollAbility()
    _charisma = Character.rollAbility()
    _hitpoints = 10 + Util.abilityModifier(_constitution)
  }

  static rollAbility() {
    var random = Random.new()
    var sum = 0
    var min_number = 6

    for (count in (1..4)) {
      var number = random.int(1, 7)
      sum = sum + number
      min_number = min_number.min(number)
    }
    return sum - min_number
  }

  strength { _strength }

  dexterity { _dexterity }

  constitution { _constitution }

  intelligence { _intelligence }

  wisdom { _wisdom }

  charisma { _charisma }

  hitpoints { _hitpoints }
}

class Util {
  static abilityModifier(n) {
    if (n < 3) Fiber.abort("Ability scores must be at least 3")
    if (n > 18) Fiber.abort("Ability scores can be at most 18")
    return ((n - 10) / 2).floor
  }
}
