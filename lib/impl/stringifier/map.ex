defimpl Digger.Stringifier.Protocol, for: Map do
  alias Digger.Stringifier.Delegator

  def stringify(map, _stringify) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.stringify(key, "stringify") => Delegator.stringify(value, "no_stringify")}) end)
  end
end
