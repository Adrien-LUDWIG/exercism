def largest_product(series: str, size: int) -> int:
    """
    Takes a string representing a natural number.
    Splits it into substrings of length `size`.
    Maps the substrings to the product of its digits.
    Returns the biggest product.

    :param series: String representing a natural number.
    :param size: Length of substrings.
    :return: Biggest subtring's digits' product.
    """
    subseries = slices(series, size)

    products = []

    for subserie in subseries:
        digits = str_to_digits(subserie)

        product = 1
        for digit in digits:
            product *= digit

        products.append(product)

    return max(products)


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
        raise ValueError("span must not be negative")
    if len(series) < length:
        raise ValueError("span must be smaller than string length")

    index = 0
    subseries = []

    while (index + length) <= len(series):
        subseries.append(series[index:(index + length)])
        index += 1

    return subseries


def str_to_digits(number_string: str) -> list[int]:
    """
    Converts a string representing a natural number to the list of his digits.

    :param number_string: String representing a natural number.
    :return: List of `number_string`'s digits.
    """

    digits = []

    for digit in number_string:
        if digit not in "0123456789":
            raise ValueError("digits input must only contain digits")

        digits.append(int(digit))

    return digits
