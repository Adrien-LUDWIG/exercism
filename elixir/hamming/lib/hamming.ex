defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(string1, string2) do
    try do
      {:ok, hamming(string1, string2, 0)}
    rescue
      FunctionClauseError -> {:error, "strands must be of equal length"}
    end
  end

  defp hamming(~c"", ~c"", diff_count), do: diff_count

  defp hamming([head1 | tail1], [head2 | tail2], diff_count) when head1 == head2 do
    hamming(tail1, tail2, diff_count)
  end

  defp hamming([head1 | tail1], [head2 | tail2], diff_count) when head1 != head2 do
    hamming(tail1, tail2, diff_count + 1)
  end
end
