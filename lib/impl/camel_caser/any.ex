defimpl Digger.CamelCaser, for: Any do
  def camel_case(any, _), do: any
end
