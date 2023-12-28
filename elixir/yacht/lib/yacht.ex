defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer

  def score(category, dice) when category == :ones do
    dice |> Enum.count(&(&1 == 1))
  end

  def score(category, dice) when category == :twos do
    2 * (dice |> Enum.count(&(&1 == 2)))
  end

  def score(category, dice) when category == :threes do
    3 * (dice |> Enum.count(&(&1 == 3)))
  end

  def score(category, dice) when category == :fours do
    4 * (dice |> Enum.count(&(&1 == 4)))
  end

  def score(category, dice) when category == :fives do
    5 * (dice |> Enum.count(&(&1 == 5)))
  end

  def score(category, dice) when category == :sixes do
    6 * (dice |> Enum.count(&(&1 == 6)))
  end

  def score(category, dice) when category == :full_house do
    cond do
      dice |> Enum.frequencies() |> Map.values() |> MapSet.new() == MapSet.new([3, 2]) ->
        dice |> Enum.sum()

      true ->
        0
    end
  end

  def score(category, dice) when category == :four_of_a_kind do
    freq = dice |> Enum.frequencies()

    cond do
      freq |> Map.values() |> Enum.max() >= 4 ->
        4 * (freq |> Enum.find(fn {_key, val} -> val >= 4 end) |> elem(0))

      true ->
        0
    end
  end

  def score(category, dice) when category == :little_straight do
    cond do
      dice |> MapSet.new() == MapSet.new([1, 2, 3, 4, 5]) ->
        30

      true ->
        0
    end
  end

  def score(category, dice) when category == :big_straight do
    cond do
      dice |> MapSet.new() == MapSet.new([2, 3, 4, 5, 6]) ->
        30

      true ->
        0
    end
  end

  def score(category, dice) when category == :choice do
    dice |> Enum.sum()
  end

  def score(category, dice) when category == :yacht do
    cond do
      dice |> Enum.dedup() |> length() == 1 -> 50
      true -> 0
    end
  end
end
