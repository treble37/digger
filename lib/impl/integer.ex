defimpl Digger, for: Integer do
  alias Digger.Core

  def atomize(integer, opts), do: Core.integer(integer, :atomize, opts)
  def camel_case(integer, opts), do: Core.integer(integer, :camel_case, opts)
  def dasherize(integer, opts), do: Core.integer(integer, :dasherize, opts)
  def lowercase_first(integer, opts), do: Core.integer(integer, :lowercase_first, opts)
  def snake_case(integer, opts), do: Core.integer(integer, :snake_case, opts)
  def stringify(integer, opts), do: Core.integer(integer, :stringify, opts)
  def upcase_first(integer, opts), do: Core.integer(integer, :upcase_first, opts)
end
