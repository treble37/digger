defimpl Digger, for: BitString do
  alias Digger.Core

  def atomize(string, opts), do: Core.string(string, :atomize, opts)
  def camel_case(string, opts), do: Core.string(string, :camel_case, opts)
  def dasherize(string, opts), do: Core.string(string, :dasherize, opts)
  def flatten(string, _opts), do: string
  def lowercase_first(string, opts), do: Core.string(string, :lowercase_first, opts)
  def snake_case(string, opts), do: Core.string(string, :snake_case, opts)
  def stringify(string, opts), do: Core.string(string, :stringify, opts)
  def unflatten(string, _opts), do: string
  def upcase_first(string, opts), do: Core.string(string, :upcase_first, opts)
end
