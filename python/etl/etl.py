def transform(legacy_data: dict[int, list[str]]) -> dict[str, int]:
    """
    Transform scrabble data from a format to another.

    :param legacy_data: Old format. Map of value to list of uppercase letters.
    :return: New format. Map of lowercase letter to value.
    """
    new_data = {}

    for value, letters in legacy_data.items():
        for letter in letters:
            new_data[letter.lower()] = value

    return new_data
