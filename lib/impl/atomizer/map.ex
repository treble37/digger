defimpl Digger.Atomizer.Protocol, for: Map do
  alias Digger.Atomizer.Delegator

  def atomize(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.atomize(key) => value}) end)
  end
end
