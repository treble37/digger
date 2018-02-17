defimpl Digger.LowerCaser, for: Map do
  alias Digger.LowerCaser

  def lowercase_first(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{LowerCaser.lowercase_first(key) => value}) end)
  end
end
