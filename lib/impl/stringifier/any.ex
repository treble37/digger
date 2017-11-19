defimpl Digger.Stringifier.Protocol, for: Any do
  def stringify(any, _stringify), do: any
end
