defimpl Digger.Stringifier, for: Float do
  def stringify(float, :stringify), do: float |> Float.to_string
  def stringify(float, _stringify), do: float
end
