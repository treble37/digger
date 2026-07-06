defimpl Digger, for: Map do
  alias Digger.Core

  def atomize(map, opts), do: Core.map(map, :atomize, opts)
  def camel_case(map, opts), do: Core.map(map, :camel_case, opts)
  def dasherize(map, opts), do: Core.map(map, :dasherize, opts)
  def lowercase_first(map, opts), do: Core.map(map, :lowercase_first, opts)
  def snake_case(map, opts), do: Core.map(map, :snake_case, opts)
  def stringify(map, opts), do: Core.map(map, :stringify, opts)
  def upcase_first(map, opts), do: Core.map(map, :upcase_first, opts)
end
