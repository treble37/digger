defimpl Digger.Stringifier, for: Float do
  def stringify(float, type: :key, stringify_key: true, stringify_value: _),
    do: float |> Float.to_string()

  def stringify(float, type: :value, stringify_key: _, stringify_value: true),
    do: float |> Float.to_string()

  def stringify(float, _), do: float
end
