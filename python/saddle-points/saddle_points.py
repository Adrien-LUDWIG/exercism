def saddle_points(matrix):
    # Handle empty matrixe
    if not matrix:
        return {}

    # Handle irregular matrix
    row_length = len(matrix[0])

    if any(len(row) != row_length for row in matrix):
        raise ValueError("irregular matrix")

    # Find saddle points
    row_maximas = list(map(max, matrix))
    col_maximas = list(map(min, zip(*matrix)))

    return [
        {"row": i + 1, "column": j + 1}
        for i, row_maxima in enumerate(row_maximas)
        for j, col_maxima in enumerate(col_maximas)
        if row_maxima == col_maxima
    ]
