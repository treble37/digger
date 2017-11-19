defimpl Digger.Stringifier.Protocol, for: Integer do
  def stringify(float, "stringify"), do: float |> Integer.to_string
  def stringify(float, _stringify), do: float
end
