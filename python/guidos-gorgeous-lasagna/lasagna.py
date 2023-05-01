"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

#: Time (in minutes) the lasagna should bake.
EXPECTED_BAKE_TIME = 40

#: Time (in minutes) needed to prepare one layer of lasagna.
LAYER_PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time in minutes depending on the number of layers.

    :param number_of_layers: int - number of layers of your lasagna.
    :return: int - time (in minutes) needed to prapare the lasagna derived from
         `LAYER_PREPARATION_TIME`.

    Function that takes the number of layers of the desired lasagna as an argument and
    returns how many minutes are needed to prepare the lasagna based on the
    `LAYER_PREPARATION_TIME`.
    """

    return number_of_layers * LAYER_PREPARATION_TIME


def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the elapsed time in minutes since you started cooking.

    :param number_of_layers: int - number of layers of your lasagna.
    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - time (in minutes) elapsed since you started cooking.

    Function that takes the number of layers of the desired lasagna and the actual
    minutes the lasagna has been in the oven as arguments and returns how many minutes
    elapsed since you started cooking.
    """

    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
