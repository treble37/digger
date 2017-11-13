defimpl Digger.LowerCaser.Protocol, for: Map do
  alias Digger.LowerCaser.Delegator

  def lowercase_first(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.lowercase_first(key) => value}) end)
  end
end
