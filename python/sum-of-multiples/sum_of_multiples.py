def sum_of_multiples(limit: int, values: list[int]) -> int:
    """
    Takes a limit and values.
    Compute the multiples of all these values strictly inferior to limit.
    Returns the sum of these multiples.

    :param limit: Limit until which to get multiples.
    :param values: Values to get the multiples of.
    :return: Sum of all the multiples of `values` strictly inferior to `limit`.
    """
    multiples = set()

    for value in values:
        value_multiples = get_multiples_until(value, limit)
        multiples = multiples.union(value_multiples)

    return sum(multiples)


def get_multiples_until(value: int, limit: int) -> set[int]:
    """
    Takes a value and a limit.
    Returns all the multiples of that value strictly inferior to the limit.

    :param value: Value to get the multiples of.
    :param limit: Limit until which to get multiples.
    :return: Set of all the multiples of `value` strictly inferior to `limit`.
    """

    # The only multiple of 0 is 0
    if value == 0:
        return {0}

    multiple = value
    multiples = set()

    while multiple < limit:
        multiples.add(multiple)
        multiple += value

    return multiples
