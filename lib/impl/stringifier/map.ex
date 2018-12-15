defimpl Digger.Stringifier, for: Map do
  alias Digger.Stringifier

  def stringify(
        map,
        type: _type,
        stringify_key: stringify_key,
        stringify_value: stringify_value
      ) do
    map
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      Map.merge(acc, %{
        Stringifier.stringify(key,
          type: :key,
          stringify_key: stringify_key,
          stringify_value: stringify_value
        ) =>
          Stringifier.stringify(value,
            type: :value,
            stringify_key: stringify_key,
            stringify_value: stringify_value
          )
      })
    end)
  end
end
