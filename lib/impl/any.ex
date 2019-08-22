defimpl Digger, for: Any do
  def atomize(any, _opts), do: any
  def camel_case(any, _), do: any
  def dasherize(any, _opts), do: any
  def lowercase_first(any, _opts), do: any
  def snake_case(any, _opts), do: any
  def stringify(any, _), do: any
  def upcase_first(any, _opts), do: any
end
