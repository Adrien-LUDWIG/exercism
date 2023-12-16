class Flatten {
  static flatten(list) {
    var flat_list = []

    for (x in list) if (x) {
      if (x is Num) flat_list.add(x) else flat_list = flat_list + flatten(x)
    }

    return flat_list
  }
}
