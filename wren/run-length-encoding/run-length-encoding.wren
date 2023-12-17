class RLE {
  static encode(s) {
    s = s + "\0" // Avoids updating encoded after the loop
    var last_char = s[0]
    var count = 0
    var encoded = ""

    for (char in s) {
      if (last_char == char) {
        count = count + 1
      } else {
        if (count > 1) encoded = encoded + count.toString
        encoded = encoded + last_char
        last_char = char
        count = 1
      }
    }

    return encoded
  }

  static decode(s) {
    var count = 0
    var decoded = ""

    for (char in s) {
      if ("0123456789".contains(char)) {
        count = count * 10 + Num.fromString(char)
      } else {
        decoded = decoded + char * (count == 0 ? 1 : count)
        count = 0
      }
      
    }

    return decoded
  }
}
