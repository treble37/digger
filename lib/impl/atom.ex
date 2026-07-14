defimpl Digger, for: Atom do
  alias Digger.Core

  def atomize(atom, opts), do: Core.atom(atom, :atomize, opts)
  def camel_case(atom, opts), do: Core.atom(atom, :camel_case, opts)
  def dasherize(atom, opts), do: Core.atom(atom, :dasherize, opts)
  def flatten(atom, _opts), do: atom
  def lowercase_first(atom, opts), do: Core.atom(atom, :lowercase_first, opts)
  def snake_case(atom, opts), do: Core.atom(atom, :snake_case, opts)
  def stringify(atom, opts), do: Core.atom(atom, :stringify, opts)
  def unflatten(atom, _opts), do: atom
  def upcase_first(atom, opts), do: Core.atom(atom, :upcase_first, opts)
end
