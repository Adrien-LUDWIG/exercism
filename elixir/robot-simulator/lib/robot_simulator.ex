defmodule RobotSimulator do
  @type robot() :: %{dir: direction(), pos: position()}
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  defguardp is_direction(value)
            when value == :north or value == :east or value == :south or value == :west

  defguardp is_position(value)
            when is_tuple(value) and tuple_size(value) == 2 and elem(value, 0) |> is_integer() and
                   elem(value, 1) |> is_integer()

  @rotate_right %{north: :east, east: :south, south: :west, west: :north}
  @rotate_left %{north: :west, west: :south, south: :east, east: :north}
  @step %{north: {0, 1}, south: {0, -1}, east: {1, 0}, west: {-1, 0}}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when not is_direction(direction),
    do: {:error, "invalid direction"}

  def create(_direction, position) when not is_position(position),
    do: {:error, "invalid position"}

  def create(direction, position), do: %{dir: direction, pos: position}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, ""), do: robot
  def simulate({:error, _message}, _instructions), do: {:error, "invalid instruction"}

  def simulate(robot, instructions) do
    {instruction, instructions} = String.split_at(instructions, 1)

    case instruction do
      "R" ->
        %{robot | dir: @rotate_right[robot.dir]}

      "L" ->
        %{robot | dir: @rotate_left[robot.dir]}

      "A" ->
        {step_x, step_y} = @step[robot.dir]
        {pos_x, pos_y} = robot.pos
        %{robot | pos: {pos_x + step_x, pos_y + step_y}}

      _ ->
        {:error, "invalid instruction"}
    end
    |> simulate(instructions)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction(robot) do
    robot.dir
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot) do
    robot.pos
  end
end
