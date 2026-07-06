defimpl Digger, for: Float do
  alias Digger.Core

  def atomize(float, opts), do: Core.float(float, :atomize, opts)
  def camel_case(float, opts), do: Core.float(float, :camel_case, opts)
  def dasherize(float, opts), do: Core.float(float, :dasherize, opts)
  def lowercase_first(float, opts), do: Core.float(float, :lowercase_first, opts)
  def snake_case(float, opts), do: Core.float(float, :snake_case, opts)
  def stringify(float, opts), do: Core.float(float, :stringify, opts)
  def upcase_first(float, opts), do: Core.float(float, :upcase_first, opts)
end
