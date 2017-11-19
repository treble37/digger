defimpl Digger.Atomizer.Protocol, for: Map do
  alias Digger.Atomizer.Delegator

  def atomize(map, _atomize) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.atomize(key, "atomize") => Delegator.atomize(value, "no_atomize")}) end)
  end
end
