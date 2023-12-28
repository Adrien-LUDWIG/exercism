def saddle_points(matrix):
    # Handle empty matrixe
    if not matrix:
        return {}

    # Handle irregular matrix
    row_length = len(matrix[0])

    if any(len(row) != row_length for row in matrix):
        raise ValueError("irregular matrix")

    # Find saddle points
    matrix_t = list(zip(*matrix))
    return [
        {"row": i + 1, "column": j + 1}
        for i, row in enumerate(matrix)
        for j, height in enumerate(row)
        if max(row) == height and min(matrix_t[j]) == height
    ]
