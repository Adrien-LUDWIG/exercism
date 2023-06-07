def slices(series: str, length: int) -> list[str]:
    """
    Slice a string into substrings of given length.

    :param series: String.
    :param length: Length of the substrings to return.
    :return: List of `series`' substrings of length `length`.
    """
    if length == 0:
        raise ValueError("slice length cannot be zero")
    if length < 0:
        raise ValueError("slice length cannot be negative")
    if series == "":
        raise ValueError("series cannot be empty")
    if len(series) < length:
        raise ValueError("slice length cannot be greater than series length")

    index = 0
    subseries = []

    while (index + length) <= len(series):
        subseries.append(series[index:(index + length)])
        index += 1

    return subseries
