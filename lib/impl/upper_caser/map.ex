defimpl Digger.UpperCaser.Protocol, for: Map do
  alias Digger.UpperCaser.Delegator

  def upcase_first(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.upcase_first(key) => value}) end)
  end
end
