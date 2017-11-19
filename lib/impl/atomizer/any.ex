defimpl Digger.Atomizer.Protocol, for: Any do
  def atomize(any, _atomize), do: any
end
