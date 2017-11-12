defimpl Digger.CamelCaser.Protocol, for: Map do
  alias Digger.CamelCaser.Delegator

  def camelize(map, first_letter) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.camelize(key, first_letter) => value}) end)
  end
end
