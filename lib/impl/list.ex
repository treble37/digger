defimpl Digger, for: List do
  alias Digger.Core

  def atomize(list, opts), do: Core.list(list, :atomize, opts)
  def camel_case(list, opts), do: Core.list(list, :camel_case, opts)
  def dasherize(list, opts), do: Core.list(list, :dasherize, opts)
  def flatten(list, _opts), do: list
  def lowercase_first(list, opts), do: Core.list(list, :lowercase_first, opts)
  def snake_case(list, opts), do: Core.list(list, :snake_case, opts)
  def stringify(list, opts), do: Core.list(list, :stringify, opts)
  def unflatten(list, _opts), do: list
  def upcase_first(list, opts), do: Core.list(list, :upcase_first, opts)
end
