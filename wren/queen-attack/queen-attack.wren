class QueenAttack {
  static outOfBoard(index) { index < 0 || 7 < index }

  construct new(pieces) {
    _white = pieces.containsKey("white") ? pieces["white"] : [7, 3]
    _black = pieces.containsKey("black") ? pieces["black"] : [0, 3]

    if (QueenAttack.outOfBoard(_white[0])|| 
        QueenAttack.outOfBoard(_white[1]) ||
        QueenAttack.outOfBoard(_black[0]) || 
        QueenAttack.outOfBoard(_black[1])) {
          Fiber.abort("Queen must be placed on the board")
        }
      
    if (_white[0] == _black[0] && _white[1] == _black[1]) {
      Fiber.abort("Queens cannot share the same space")
    }
  }

  construct new() {
    _white = [7, 3]
    _black = [0, 3]
  }

  white { _white }
  black { _black }

  toString {
    var board = []

    for (row in (0..7)) {
      var line = []

      for (col in (0..7)) {
        if (row == _white[0] && col == _white[1]) {
          line.add("W")
        } else if (row == _black[0] && col == _black[1]) {
          line.add("B")
        } else {
          line.add("_")
        }
      }

      board.add(line.join(" "))
    }

    return board.join("\n")
  }

  canAttack { 
    return _white[0] == _black[0] ||  _white[1] == _black[1] || 
           (_white[0] - _black[0]).abs == (_white[1] - _black[1]).abs
  }
}
