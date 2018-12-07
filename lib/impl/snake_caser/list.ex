defimpl Digger.SnakeCaser, for: List do
  alias Digger.SnakeCaser

  def snake_case([]), do: []

  def snake_case([h | t]) do
    [SnakeCaser.snake_case(h)] ++ SnakeCaser.snake_case(t)
  end
end
