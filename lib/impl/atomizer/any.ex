defimpl Digger.Atomizer, for: Any do
  def atomize(any, _atomize), do: any
end
