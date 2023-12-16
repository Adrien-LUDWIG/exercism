class Flatten {
  static flatten(list) {
    var flat_list = []

    for (x in list) if (x) {
      if (x is Sequence) flat_list = flat_list + flatten(x) else flat_list.add(x)
    }

    return flat_list
  }
}
