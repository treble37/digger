defimpl Digger.Atomizer, for: Any do
  def atomize(any, _opts), do: any
end
