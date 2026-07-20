defimpl Digger, for: Tuple do
  alias Digger.Core

  def atomize(tuple, opts), do: Core.tuple(tuple, :atomize, opts)
  def camel_case(tuple, opts), do: Core.tuple(tuple, :camel_case, opts)
  def dasherize(tuple, opts), do: Core.tuple(tuple, :dasherize, opts)
  def flatten(tuple, _opts), do: tuple
  def lowercase_first(tuple, opts), do: Core.tuple(tuple, :lowercase_first, opts)
  def snake_case(tuple, opts), do: Core.tuple(tuple, :snake_case, opts)
  def stringify(tuple, opts), do: Core.tuple(tuple, :stringify, opts)
  def unflatten(tuple, _opts), do: tuple
  def upcase_first(tuple, opts), do: Core.tuple(tuple, :upcase_first, opts)
end
