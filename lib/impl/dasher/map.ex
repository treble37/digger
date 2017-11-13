defimpl Digger.Dasher.Protocol, for: Map do
  alias Digger.Dasher.Delegator

  def dasherize(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Delegator.dasherize(key) => value}) end)
  end
end
