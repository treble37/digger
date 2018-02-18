defimpl Digger.UpperCaser, for: Map do
  alias Digger.UpperCaser

  def upcase_first(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{UpperCaser.upcase_first(key) => value}) end)
  end
end
