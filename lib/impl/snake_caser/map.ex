defimpl Digger.SnakeCaser.Protocol, for: Map do
  alias Digger.SnakeCaser.Delegator

  def underscore(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.underscore(key) => value}) end)
  end
end
