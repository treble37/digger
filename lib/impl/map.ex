defimpl Digger, for: Map do
  alias Digger.Core
  alias Digger.Flattener

  def atomize(map, opts), do: Core.map(map, :atomize, opts)
  def camel_case(map, opts), do: Core.map(map, :camel_case, opts)
  def dasherize(map, opts), do: Core.map(map, :dasherize, opts)
  def flatten(map, opts), do: Flattener.flatten(map, opts)
  def lowercase_first(map, opts), do: Core.map(map, :lowercase_first, opts)
  def snake_case(map, opts), do: Core.map(map, :snake_case, opts)
  def stringify(map, opts), do: Core.map(map, :stringify, opts)
  def unflatten(map, opts), do: Flattener.unflatten(map, opts)
  def upcase_first(map, opts), do: Core.map(map, :upcase_first, opts)
end
