defimpl Digger.CamelCaser, for: Map do
  alias Digger.CamelCaser

  def camel_case(map, first_letter) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{CamelCaser.camel_case(key, first_letter) => value}) end)
  end
end
