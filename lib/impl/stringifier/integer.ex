defimpl Digger.Stringifier, for: Integer do
  def stringify(integer, type: :key, stringify_key: true, stringify_value: _),
    do: integer |> Integer.to_string()

  def stringify(integer, type: :value, stringify_key: _, stringify_value: true),
    do: integer |> Integer.to_string()

  def stringify(integer, _), do: integer
end
