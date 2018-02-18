defimpl Digger.SnakeCaser, for: Map do
  alias Digger.SnakeCaser

  def snake_case(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{SnakeCaser.snake_case(key) => value}) end)
  end
end
