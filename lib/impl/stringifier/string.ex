defimpl Digger.Stringifier.Protocol, for: BitString do
  def stringify(string, _stringify), do: string
end
