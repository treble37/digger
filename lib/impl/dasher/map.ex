defimpl Digger.Dasher, for: Map do
  alias Digger.Dasher

  def dasherize(map) do
    map
    |> Enum.reduce(%{}, fn({key, value}, acc) -> Map.merge(acc, %{Dasher.dasherize(key) => value}) end)
  end
end
