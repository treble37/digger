defimpl Digger.Atomizer, for: Map do
  alias Digger.Atomizer

  def atomize(map, _atomize) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Atomizer.atomize(key, :atomize) => Atomizer.atomize(value, :no_atomize)}) end)
  end
end
