defimpl Digger.Stringifier, for: Map do
  alias Digger.Stringifier

  def stringify(map, _stringify) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Stringifier.stringify(key, :stringify) => Stringifier.stringify(value, :no_stringify)}) end)
  end
end
